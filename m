From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Mar 2019 19:48:20 +0200
Subject: [Buildroot] [PATCH 0/2] [AUTOBUILD] Store package files list in
 results (branch yem/files-list)
Message-ID: <cover.1554054435.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series against the autobuilder code, stores the packages
files lists in autobuild results, so that it is easier to do a quick
analysis about the origin of files in a build.

Regards,
Yann E. MORIN.


The following changes since commit e90dc8753f9deaca9ecb41a5874d7a559ee2557c

  utils/daily-mail: sort overall summary in global e-mail by branch name (2019-03-15 15:19:36 +0100)


are available in the git repository at:

  /home/ymorin/cache/upstream/buildroot/buildroot-test

for you to fetch changes up to 1414cf2855df133bd02c1a32d8ebe3e632f37734

  [AUTOBUILD] autobuild-run: also copy packages files lists if they exist (2019-03-31 19:30:26 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      [AUTOBUILD] autobuild-run: add helper function to copy-if-exists
      [AUTOBUILD] autobuild-run: also copy packages files lists if they exist

 scripts/autobuild-run | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
