From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 01:11:36 +0100
Subject: [Buildroot] [PATCH 01/18] uClibc: use the Buildroot toolchain
	options instead of the hidden common options
In-Reply-To: <1849f29646ff6a451e17700961f988cb38e4e3a4.1351964808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 18:47:46 +0100")
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <1849f29646ff6a451e17700961f988cb38e4e3a4.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878vaiw7k7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since we are some day going to finally rename the badly named common
 Thomas> toolchain options (BR2_USE_WCHAR, BR2_ENABLE_LOCALE, BR2_INET_RPC,
 Thomas> etc.) into something more logical, let's start using the Buildroot
 Thomas> toolchain options in the uClibc code.

Committed, thanks.

-- 
Bye, Peter Korsgaard
