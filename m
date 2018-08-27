From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 23:57:21 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: fix build with mmx
In-Reply-To: <20180827204040.22578-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 27 Aug 2018 22:40:40 +0200")
References: <20180827204040.22578-1-fontaine.fabrice@gmail.com>
Message-ID: <8736uz8oce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 39387fc80f90f3a9ac9ef9f3aa32da5776a0721e removed mmx support
 > however aircrack-ng fails to build on platforms with mmx because an
 > error is raised if __MMX__ is defined.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/b7362b69435e9ef6fb2aedc50743e88dbd7a5c72

 > [Upstream status: merged
 > (https://github.com/aircrack-ng/aircrack-ng/pull/1943)]

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
