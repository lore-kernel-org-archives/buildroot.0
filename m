From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 14:25:33 +0200
Subject: [Buildroot] [git commit] Update .gitlab-ci.yml after addition of
 luaposix test
Message-ID: <20190801122412.A77E48155E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03bd0c5b31bbfb7a39931a1dc5fe4367c2e0a74e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a0b0976c9333 (support/testing: add luaposix test) added a new test,
but forgot to update .gitlab-ci.yml.  Do that now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 724de5bbc5..1a846d402a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -383,6 +383,8 @@ tests.package.test_luafilesystem.TestLuaLuaFileSystem: { extends: .runtime_test
 tests.package.test_luafilesystem.TestLuajitLuaFileSystem: { extends: .runtime_test }
 tests.package.test_luaossl.TestLuaLuaossl: { extends: .runtime_test }
 tests.package.test_luaossl.TestLuajitLuaossl: { extends: .runtime_test }
+tests.package.test_luaposix.TestLuaLuaPosix: { extends: .runtime_test }
+tests.package.test_luaposix.TestLuajitLuaPosix: { extends: .runtime_test }
 tests.package.test_luasec.TestLuaLuaSec: { extends: .runtime_test }
 tests.package.test_luasec.TestLuajitLuaSec: { extends: .runtime_test }
 tests.package.test_luasocket.TestLuaLuaSocket: { extends: .runtime_test }
