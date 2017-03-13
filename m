From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:20:10 +0100
Subject: [Buildroot] [PATCH 0/4] package/nbd: fixes and bump
In-Reply-To: <20170312142915.27e2025b@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 12 Mar 2017 14:29:15 +0100")
References: <cover.1489312674.git.yann.morin.1998@free.fr>
 <20170312142915.27e2025b@free-electrons.com>
Message-ID: <87lgs8wyqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 12 Mar 2017 10:58:15 +0100, Yann E. MORIN wrote:

 >> Yann E. MORIN (4):
 >> package/nbd: rename options
 >> package/nbd: fix utilities locations
 >> package/nbd: add option for the trdump utility
 >> package/nbd: bump version

 > Applied, thanks!

 > Peter: I believe we want to apply PATCH 2/4 to the LTS branch. However,
 > it will conflict a bit because Yann did the renaming of options before
 > the fix, but the conflicts should be trivial to resolve.

Committed patch 2 to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
