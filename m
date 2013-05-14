From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 17:22:01 +0200
Subject: [Buildroot] [PATCH] toolchain: blackfin: Remove Blackfin
	toolchain 2011R1 release.
In-Reply-To: <CAJxxZ0M+SDkyQeadhvmmMXgM9R=dqJU3Pdhq8b1Qef2nDDhLKQ@mail.gmail.com>
 (Sonic Zhang's message of "Tue, 14 May 2013 15:57:49 +0800")
References: <1365580213-23039-1-git-send-email-sonic.adi@gmail.com>
 <CAJxxZ0MT5top5C8-jMMrqeSOiSpeMvLDVXx5f3EmU4gZSX6kPQ@mail.gmail.com>
 <20130514094214.1414d216@skate>
 <CAJxxZ0M+SDkyQeadhvmmMXgM9R=dqJU3Pdhq8b1Qef2nDDhLKQ@mail.gmail.com>
Message-ID: <87a9nxsi1y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:

 >> Could you point to specific problems with this toolchain, or give a
 >> more precise commit log?
 >> 

 Sonic> ADI officially supports the buildroot and related GNU toolchain for
 Sonic> Blackfin since ADI's 2012R1 release only. In order to avoid confusion,
 Sonic> it is better to remove the 2011R1 GNU toolchain for Blackfin. In
 Sonic> addition, the 2011R1 GNU toolchain for Blackfin doesn't support the
 Sonic> BF60x processors.

Thanks. Could you add that info to the commit message, please?

-- 
Bye, Peter Korsgaard
