# toonflix

A new Flutter project.

### Hello Flutter

- flutter project 생성

```
flutter create 폴더이름
```

### VSCode Settings

- command palette(cmd + shift + p)
  - open user settings (json) 검색

```json
/**
* 기존 source.fixAll.eslint가 설정되어 있는 경우에도
* source.fixAll을 true로 설정하면 eslint까지 모두 설정이 됨
*/
"editor.codeActionsOnSave": {
  "source.fixAll": true
},
"[dart]": {
  "editor.formatOnSave": true,
  "editor.formatOnType": true
},
```

### 단축키

- `st` 만 작성시 Stateful Widget, Stateless Widget 스니펫을 가져올 수 있다.

### 다트/플러터 패키지

- npm 같은 개념
- 다트/플러터 공식 패키지 보관소 https://pub.dev/

- 패키지 설치하는 법

```
dart pub add http
flutter pub add http

또는 pubspec.yaml 파일에 (설정 파일)
dependencies:
  http: ^0.13.5
를 추가 후 dart pub get (또는 flutter pub get) 로 설치. (보통 저장하면 자동적으로 설치 됨. 또는 yaml파일 들어갔을 때 나오는 다운로드 버튼 (get pacakges)을 클릭)
```
