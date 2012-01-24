From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2012 11:53:32 +0100
Subject: [Buildroot] [PATCH] pkg-infra: fix missing 3993 for
 AUTOTARGET's SUBDIR
In-Reply-To: <201201232107.49146.arnout@mind.be>
References: <1327182759-23029-1-git-send-email-arnout@mind.be>
 <87aa5fgyz0.fsf@macbook.be.48ers.dk>
 <201201232107.49146.arnout@mind.be>
Message-ID: <20120124115332.19c44e64@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jan 2012 21:07:48 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  The 3993 is a $$ which got expanded to the shell's PID.  So no my
> shell's PID is saved in history for eternity :-)

Ah, ah :-) I was wondering what was the meaning of this 3993 number :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
