From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Jun 2017 13:21:13 +0200
Subject: [Buildroot] [PATCH 0/2 v2] package/qt5base: fix sparc
	compilation
In-Reply-To: <20170608232128.2c5d553c@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 8 Jun 2017 23:21:28 +0200")
References: <cover.1495055675.git.yann.morin.1998@free.fr>
 <20170608232128.2c5d553c@free-electrons.com>
Message-ID: <87r2yt8l06.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 17 May 2017 23:15:23 +0200, Yann E. MORIN wrote:

 >> Yann E. MORIN (2):
 >> package/qt5base: install arch-specific configuration
 >> package/qt5base: link with -latomic for sparc

 > Both applied to master. Thanks!

 > Peter: those are fixing a build issue, but only on Sparc, so I don't
 > know how much we want those patches in the LTS branch.

They seem quite safe and a test build with them applied on the LTS
branch succeeded, so committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
