From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:57:43 +0200
Subject: [Buildroot] [PATCHv2] ktap: bump version for linux-4.8 support
In-Reply-To: <20180331102711.12328-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 31 Mar 2018 12:27:11 +0200")
References: <20180331102711.12328-1-peter@korsgaard.com>
Message-ID: <87fu4gt6mw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes #10776
 > The upstream git repo contains a number of fixes for building against newer
 > kernel versions, so bump the version.

 > git shortlog eb66d40310c93dc82bc8eac889744c1ed1f01f7b..
 > Alain Kalker (2):
 >       uprobe: Print the symbol, not the matching pattern
 >       uprobe: Blacklist uretprobes on _start

 > Aleksa Sarai (2):
 >       runtime: update GFP_WAIT to GFP_RECLAIM
 >       userspace: fix up argument parsing NULL dereference

 > Alexey Makhalov (1):
 >       Fix building for v4.8 kernel

 > Azat Khuzhin (12):
 >       Use get_unused_fd_flags(0) instead of get_unused_fd()
 >       Support trace_seq::seq
 >       Ignore separate debug files (*.dwo)
 >       Use trace_seq_has_overflowed()
 >       makefile: split vim plugins installing into separate target
 >       makefile: use DESTDIR for install (allow to change install dir)
 >       makefile: install: create dirs
 >       makefile: use ldflags for linking ktap
 >       makefile: add CPPFLAGS to KTAPC_CFLAGS, to allow change default flags
 >       ignore: exclude /debian
 >       Support compilation for 4.2 (ftrace_events cleanup)
 >       runtime: fix building on 4.3

 > Jovi Zhangwei (11):
 >       Merge pull request #84 from azat/linux-3.19-fixes-v3
 >       Merge pull request #85 from azat/debian-preparations-v2
 >       Merge pull request #88 from NanXiao/master
 >       Merge pull request #89 from NanXiao/patch-1
 >       Merge pull request #91 from NanXiao/patch-1
 >       Merge pull request #90 from azat/linux-4.2-compilation-fixes
 >       Merge pull request #99 from cyphar/fix-null-deref
 >       Merge pull request #98 from cyphar/fix-gfp-reclaim
 >       Merge pull request #97 from azat/fix-building-4.3-__GFP_RECLAIM
 >       Merge pull request #103 from ackalker/blacklist
 >       Merge pull request #104 from YustasSwamp/master

 > Nan Xiao (3):
 >       Update tutorial.md
 >       Update Makefile
 >       Fix memory leak issue in main function.

 > WEI ZHANG (1):
 >       ktap: Change the copyright to Huawei Technologies

 > While we are at it, also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > NOTICE: Ktap seems pretty dead upstream, so perhaps we should deprecate it?

 > Changes since v1:
 > - Fix .hash file

Committed, thanks.

-- 
Bye, Peter Korsgaard
