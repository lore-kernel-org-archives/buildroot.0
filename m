From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 01:13:28 +0100
Subject: [Buildroot] [PATCH 03/18] toolchain-crosstool-ng: use the
	Crosstool-ng config options instead of the common hidden ones
In-Reply-To: <cfe1f812fb80ad1cdbd18ea18cf08e0557773d96.1351964808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 18:47:48 +0100")
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cfe1f812fb80ad1cdbd18ea18cf08e0557773d96.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zk2yuswn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since we are some day going to finally rename the badly named common
 Thomas> toolchain options (BR2_USE_WCHAR, BR2_ENABLE_LOCALE, BR2_INET_RPC,
 Thomas> etc.) into something more logical, let's start using the Crosstool-NG
 Thomas> toolchain options in the Crosstool-NG code.

Committed, thanks.

-- 
Bye, Peter Korsgaard
