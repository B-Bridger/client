# Bridger - Flutter 크로스 플랫폼 프로젝트 구조 요약

## 📁 프로젝트 구조

```
lib/
├── main.dart                       # 앱 진입점 및 전역 설정
├── models/                         # 데이터 모델
│   └── user.dart                   # 사용자 모델 (fromJson, toJson, copyWith 포함)
├── services/                       # 비즈니스 로직 및 외부 서비스
│   ├── user_service.dart           # 사용자 CRUD 서비스 (더미 데이터)
│   └── window_service.dart         # 데스크톱 윈도우 관리 서비스
├── providers/                      # 상태 관리 (Provider 패턴)
│   └── user_provider.dart          # 사용자 상태 관리
├── ui/                             # 사용자 인터페이스
│   ├── screens/                    # 화면 위젯
│   │   ├── splash_screen.dart      # 스플래시 화면
│   │   ├── home_screen.dart        # 홈 화면 (반응형 레이아웃)
│   │   └── settings_screen.dart    # 설정 화면
│   └── widgets/                    # 재사용 가능한 위젯
│       ├── responsive_widgets.dart # 반응형 위젯 (ResponsiveBuilder, ResponsiveLayout)
│       ├── user_card.dart          # 사용자 카드 위젯
│       └── common_widgets.dart     # 공통 위젯 (Loading, Error, Empty State)
└── utils/                          # 유틸리티 함수 및 상수
    ├── responsive_utils.dart       # 반응형 유틸리티 (브레이크포인트, 그리드 설정)
    └── constants.dart              # 앱 상수 및 문자열
```

## 🚀 주요 기능

### 1. 반응형 디자인

- **모바일** (< 600px): 싱글 컬럼 리스트 레이아웃
- **태블릿** (600px - 1200px): 2-3 컬럼 그리드 레이아웃
- **데스크톱** (> 1200px): 4 컬럼 그리드 레이아웃

### 2. 크로스 플랫폼 지원

- **Android**: 기본 지원
- **iOS**: 기본 지원
- **macOS**: window_manager를 통한 윈도우 관리
- **Windows**: bitsdojo_window를 통한 고급 윈도우 제어

### 3. 상태 관리

- **Provider 패턴**: 효율적인 상태 관리
- **로딩 상태**: 비동기 작업 처리
- **에러 처리**: 사용자 친화적 에러 표시

### 4. 윈도우 관리 (데스크톱)

- 최소/최대 윈도우 크기 설정
- 윈도우 중앙 배치
- 플랫폼별 윈도우 동작 최적화

## 🎨 UI/UX 특징

### 디자인 시스템

- **Material Design 3**: 최신 구글 디자인 시스템
- **다크/라이트 테마**: 시스템 테마 자동 전환
- **일관된 색상 체계**: ColorScheme.fromSeed 사용

### 반응형 컴포넌트

- **ResponsiveBuilder**: 화면 크기에 따른 조건부 렌더링
- **ResponsiveLayout**: 모바일/태블릿/데스크톱 레이아웃 자동 선택
- **ResponsiveContainer**: 최대 너비 제한 및 중앙 정렬

## 📦 의존성 패키지

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.1 # 상태 관리
  bitsdojo_window: ^0.1.6 # Windows/Linux 윈도우 관리
  window_manager: ^0.3.8 # 크로스 플랫폼 윈도우 관리
```

## 🔧 개발 패턴

### 1. Clean Architecture

- **모듈화**: 모델, 서비스, UI 계층 분리
- **상태 관리**: Provider를 통한 의존성 관리

### 2. 반응형 디자인 패턴

- **브레이크포인트 기반**: 일관된 반응형 기준
- **컨텍스트 기반 계산**: MediaQuery를 통한 동적 크기 조정
- **플랫폼 특화**: 각 플랫폼에 최적화된 UI

### 3. 상태 관리 패턴

- **Provider 패턴**: ChangeNotifier를 통한 상태 변경 알림
- **비동기 처리**: Future를 통한 API 호출 시뮬레이션
- **에러 핸들링**: try-catch를 통한 안전한 에러 처리

## 🛠️ 빌드 및 실행

### 개발 환경 실행

```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows

# Android
flutter run -d android

# iOS
flutter run -d ios
```

### 릴리즈 빌드

```bash
# macOS
flutter build macos

# Windows
flutter build windows

# Android
flutter build apk

# iOS
flutter build ios
```
