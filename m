From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 19:28:23 +0100
Subject: [Buildroot] [PATCH] board/beaglebone: fix boot on BeagleBone
 Black
In-Reply-To: <20191109152254.15562-1-unixmania@gmail.com> (unixmania's message
 of "Sat, 9 Nov 2019 12:22:54 -0300")
References: <20191109152254.15562-1-unixmania@gmail.com>
Message-ID: <871rtz22bc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Commit 68b5b79b2f has set the getty port to the default console but left
 > "ttyO0" in bootargs, in the U-Boot environment. Use "ttyS0", instead.

 > Also set loadaddr to 0x82000000 and fdtaddr to 0x88000000, replacing the
 > values that were valid for the ancient U-Boot and Linux pre-installed on
 > old boards but cause boot hangs with the current versions.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > CC: Lothar Felten <lothar.felten@gmail.com>
 > ---
 > Changes v1->v2:
 > - Clarify the explanation about old U-Boot versions in the commit
 >   message.

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
