From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 12:10:17 +0200
Subject: [Buildroot] [PATCH 0/3] go package fixes
Message-ID: <20180511101020.10295-1-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In this patch series, you'll find a fix to the build issues in the go
package, as well as a debug feature and a minor version bump.

Regards,

Anisse

--

Anisse Astier (3):
  go: patch to fix cross-compilation support
  go: honor building with V=1 for debugging purposes
  go: bump to version 1.10.2

 DEVELOPERS                                         |  3 ++
 ...dist-explicit-option-for-crosscompilation.patch | 52 ++++++++++++++++++++++
 package/go/go.hash                                 |  2 +-
 package/go/go.mk                                   | 36 +++++----------
 4 files changed, 68 insertions(+), 25 deletions(-)
 create mode 100644 package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch

-- 
2.13.6
