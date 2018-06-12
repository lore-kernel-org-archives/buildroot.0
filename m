From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 15:01:58 +0200
Subject: [Buildroot] [PATCH 4/4] board/synopsys: synchronize custom
 inittab with BusyBox' one
In-Reply-To: <20180611060016.20755-5-casantos@datacom.com.br> (Carlos Santos's
 message of "Mon, 11 Jun 2018 03:00:16 -0300")
References: <20180611060016.20755-1-casantos@datacom.com.br>
 <20180611060016.20755-5-casantos@datacom.com.br>
Message-ID: <87602o6tvd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Apply modifications made in recent commits:
 > - 456ea9871e busybox: add /dev/std{in, out, err} symlinks to inittab
 > - 13dbe73782 busybox: reduce number of mkdir calls in inittab
 > - 8a89d290d4 busybox: add an inittab entry to activate swap

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > This change was tested on a VM, only. I don't have a Synopsys board.

Committed, thanks.

Me neither. It would be nicer if this synopsys board would just add the
missing lines to the standard inittab in a post-build script, similar to
how we do it for the raspberry pi instead of having a local copy - But
OK.

-- 
Bye, Peter Korsgaard
