From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 10:39:13 +0000
Subject: [Buildroot] [Bug 12906] New: qt PrefixPath is wrong on 2020.05-rc1
Message-ID: <bug-12906-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12906

            Bug ID: 12906
           Summary: qt PrefixPath is wrong on 2020.05-rc1
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jharjuma at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The PrefixPath is /. It should be /usr. For example QML modules are under
/usr/qml not /qml.

Head of 'qtdiag --no-gl':

Qt 5.14.2 (arm-little_endian-ilp32-eabi-hardfloat shared (dynamic) release
build; by GCC 7.5.0) on "eglfs"
OS: Buildroot 2020.05-rc1 [linux version 5.4.3]

Architecture: arm; features:

Environment:

Features: QT_NO_EXCEPTIONS

Library info:
  PrefixPath: /
  DocumentationPath: /doc
  HeadersPath: /include/qt5
  LibrariesPath: /lib
  LibraryExecutablesPath: /libexec
  BinariesPath: /bin
  PluginsPath: /lib/qt/plugins
  ImportsPath: /imports
  Qml2ImportsPath: /qml
  ArchDataPath: /
  DataPath: /
  TranslationsPath: /translations
  ExamplesPath: /lib/qt/examples
  TestsPath: /tests
  SettingsPath: /etc/xdg

-- 
You are receiving this mail because:
You are on the CC list for the bug.
