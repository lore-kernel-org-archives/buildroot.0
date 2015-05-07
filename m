From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 22:21:16 +0200
Subject: [Buildroot] [PATCH] cryptsetup: disable on broken NIOS 2
	toolchains
In-Reply-To: <1430859572-30900-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 May 2015 22:59:32 +0200")
References: <1430859572-30900-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a8xgm94z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This package triggers the infamous _gp issue with the external NIOS 2
 > toolchains, so let's disable it.

 > Fixes:

 >   http://autobuild.buildroot.org/results/ff4/ff456344eb5bc8af619c1f5d88be0cb758dd5075/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
