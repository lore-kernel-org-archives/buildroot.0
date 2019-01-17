From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 23:13:06 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: bump version to 10.3.5
In-Reply-To: <20190117191322.6409-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 17 Jan 2019 20:13:22 +0100")
References: <20190117191322.6409-1-peter@korsgaard.com>
Message-ID: <875zun6ih9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes build against glibc 2.28: closes #11546
 > http://autobuild.buildroot.net/results/f2c/f2c73480b5a1060bb17ac260ef82c3e641fad085/
 > http://autobuild.buildroot.net/results/e21/e219b8bacb52bb661eb6663b82f549ed941f26fe/

 > Use released tarball rather than github helper.  The tarball does not
 > contain the open-vm-tools sub directory, so adjust the paths in the patches
 > to match and drop OPENVMTOOLS_SUBDIR.

 > Drop 0001-has_bsd_printf.patch: msgList.c has been removed upstream since:
 > https://github.com/vmware/open-vm-tools/commit/dc81979e78e1b8f42639aeb7aaec69f7ea49eb79

 > Drop 0004-uclibc_secure_getenv.sh: uClibc-ng provides secure_getenv() since
 > 1.0.22.

 > Renumber remaining patches.

 > Add hash for license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
