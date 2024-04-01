import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FollowersRecord extends FirestoreRecord {
  FollowersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['Users']);
    _name = snapshotData['Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Followers');

  static Stream<FollowersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FollowersRecord.fromSnapshot(s));

  static Future<FollowersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FollowersRecord.fromSnapshot(s));

  static FollowersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FollowersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FollowersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FollowersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FollowersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FollowersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFollowersRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowersRecordDocumentEquality implements Equality<FollowersRecord> {
  const FollowersRecordDocumentEquality();

  @override
  bool equals(FollowersRecord? e1, FollowersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) && e1?.name == e2?.name;
  }

  @override
  int hash(FollowersRecord? e) =>
      const ListEquality().hash([e?.users, e?.name]);

  @override
  bool isValidKey(Object? o) => o is FollowersRecord;
}
