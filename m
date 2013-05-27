From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 May 2013 13:36:48 +0200
Subject: [Buildroot] [PATCH 05/20] toolchain: blackfin: Remove Blackfin
	toolchain 2011R1 release.
In-Reply-To: <1369606110-8088-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:15 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppwcd57z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Sonic Zhang <sonic.zhang@analog.com>
 Thomas> ADI officially supports the buildroot and related GNU toolchain for
 Thomas> Blackfin since ADI's 2012R1 release only. In order to avoid confusion,
 Thomas> it is better to remove the 2011R1 GNU toolchain for Blackfin. In
 Thomas> addition, the 2011R1 GNU toolchain for Blackfin doesn't support the
 Thomas> BF60x processors.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
