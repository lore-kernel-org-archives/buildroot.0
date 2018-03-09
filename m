From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Mar 2018 22:55:08 +0100
Subject: [Buildroot] [PATCH] configs/riotboard: remove defconfig
In-Reply-To: <20180307203048.13412-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 7 Mar 2018 21:30:48 +0100")
References: <20180307203048.13412-1-thomas.petazzoni@bootlin.com>
Message-ID: <87bmfwhq2r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This defconfig fails to build with gcc 6.x, even though we switched to
 > using gcc 6.x as the default gcc version in May 2017.

 > This defconfig also hasn't seen any non-mechanical update since
 > November 2015.

 > So it's time to get rid of it, in order to remove the following build
 > failure:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306938

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
