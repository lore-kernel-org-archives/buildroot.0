From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2018 07:22:48 +0000
Subject: [Buildroot] [Bug 11416] New: check-uniq-files staging issue
Message-ID: <bug-11416-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11416

            Bug ID: 11416
           Summary: check-uniq-files staging issue
           Product: buildroot
           Version: 2018.02.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Lots of false positive are happening for files located in staging directory
when building, even when building from scratch e.g. :
Warning: staging file "./usr/lib/libnl-route-3.la" is touched by more than one
package: [u'libnl', u'json-c', u'ncurses', u'readline', u'lvm2', u'popt',
u'util-linux', u'cryptsetup', u'expat', u'dbus', u'e2fsprogs', u'kmod',
u'eudev', u'libpng', u'freetype', u'libopenssl', u'ffmpeg', u'giflib',
u'graphite2', u'icu', u'libffi', u'pcre', u'libglib2', u'harfbuzz',
u'jpeg-turbo', u'json-glib', u'libcap', u'libcurl', u'libexif', u'libmng',
u'libnspr', u'sqlite', u'libnss', u'libogg', u'pciutils', u'tremor', u'webp',
u'wpa_supplicant', u'CUnit']

-- 
You are receiving this mail because:
You are on the CC list for the bug.
