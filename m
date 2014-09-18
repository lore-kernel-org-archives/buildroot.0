From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Sep 2014 22:12:42 +0200
Subject: [Buildroot] [PATCH 2/4] arch: remove BR2_arm10t
In-Reply-To: <1410814919-11523-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 15 Sep 2014 23:01:57 +0200")
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tr8662t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The BR2_arm10t option is not correct as it references an ARM family,
 > while other options indicate a specific ARM core. The ARM cores in
 > ARM10 family are ARM1020E, ARM1022E and ARM1026EJ-S according to
 > Wikipedia. However, those are clearly very rare, and Wikipedia also
 > indicates two Conexant ADSL-related SoC as being part of this family
 > of ARM cores. Therefore, this commit removes this ARM family.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the reference in nettle.mk removed / commit message
tweaked, thanks.

-- 
Bye, Peter Korsgaard
