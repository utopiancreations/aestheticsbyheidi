import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ArtRecord extends FirestoreRecord {
  ArtRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _image = snapshotData['Image'] as String?;
    _link = snapshotData['Link'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Art');

  static Stream<ArtRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtRecord.fromSnapshot(s));

  static Future<ArtRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtRecord.fromSnapshot(s));

  static ArtRecord fromSnapshot(DocumentSnapshot snapshot) => ArtRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtRecordData({
  String? title,
  String? description,
  String? image,
  String? link,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'Image': image,
      'Link': link,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtRecordDocumentEquality implements Equality<ArtRecord> {
  const ArtRecordDocumentEquality();

  @override
  bool equals(ArtRecord? e1, ArtRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.link == e2?.link &&
        e1?.time == e2?.time &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(ArtRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.image, e?.link, e?.time, e?.likes]);

  @override
  bool isValidKey(Object? o) => o is ArtRecord;
}
