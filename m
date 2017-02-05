From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun,  5 Feb 2017 14:45:05 +0100
Subject: [Buildroot] [PATCHv2 0/2] instrumentation: extend
	packages-file-list.txt
Message-ID: <20170205134507.15328-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The main goal of this patch is to add symbolic link entries in
packages-file-list.txt, in addition to regular files.

In v2, as suggested by Peter Korsgaard, directories and links to directories are
added too.

Thomas De Schampheleire (2):
  instrumentation: extract duplication to get list of installed files
  instrumentation: extend packages-file-list.txt with symlinks and
    directories

 package/pkg-generic.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
2.10.2
