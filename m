From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Oct 2011 09:57:13 +0200
Subject: [Buildroot] [PATCH 9/9] toolchain: speed up sysroot lib copying
In-Reply-To: <00e260122ba4b08d9809dd9eaa00dc3a25f84dbd.1318182187.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Oct 2011 19:44:32 +0200")
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <00e260122ba4b08d9809dd9eaa00dc3a25f84dbd.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrcdcm92.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Mike Frysinger <vapier@gentoo.org>
 Thomas> The copy_toolchain_lib_root helper searches the entire sysroot, but is
 Thomas> only interested in files in certain subdirs.  So rather than waste time
 Thomas> in walking the entire tree, walk the few subdirs at the depth level we
 Thomas> are actually going to be poaching files from.

Committed, thanks.

-- 
Bye, Peter Korsgaard
