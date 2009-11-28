From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 08:13:11 -0600
Subject: [Buildroot] Build jobbing
In-Reply-To: <87tywe4ube.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911271610.08010.minimod@morethan.org>
	<87tywe4ube.fsf@macbook.be.48ers.dk>
Message-ID: <200911280813.12919.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
> Hi,
> 
>  Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.
> 
> I take it that you mean flash_eraseall / flash_unlock / flash_lock?
> 
> It works for me after 4e385ee7 - Could you update and try again?
> 

Yes, it was a long day.

Indeed, these are not "options", without them the firmware will
never get off the first cylinder of the media storage device.

Mike
