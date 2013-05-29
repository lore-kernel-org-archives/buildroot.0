From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 21:21:32 +0200
Subject: [Buildroot] [PATCH 1/2] czmq: prevent selection when ADI
	Blackfin external toolchains are used
In-Reply-To: <1369770335-6995-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 21:45:34 +0200")
References: <1369770335-6995-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369770335-6995-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip21618j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> czmq fails to build with the Blackfin external toolchains provided by
 Thomas> Analog Devices, because their uClibc configuration doesn't include
 Thomas> AI_ADDRCONFIG. In order to prevent such build failures to happen, we
 Thomas> simply prevent the selection of czmq or one of its reverse
 Thomas> dependencies when such toolchains are used.

 Thomas> This fixes:

 Thomas>   http://autobuild.buildroot.org/results/821/82140fac4c2a2cef3f38f06cada8f17fd7f0078b/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
