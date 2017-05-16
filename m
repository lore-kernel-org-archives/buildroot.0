From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 May 2017 23:23:54 +0200
Subject: [Buildroot] RPi B+ update
In-Reply-To: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
References: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
Message-ID: <20170516232354.2080bf15@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Tue, 16 May 2017 21:32:26 +0200, Marco Trapanese <marcotrapanese@gmail.com> wrote:

> Hi!
> A couple of years ago (it was in 2015) I built a buildroot environment 
> for RPi B+. We ended up with an sd-card image that was cloned for every 
> installation.
> This months we've bought some other RPi B+ but with this batch the 
> system refuses to boot: it hangs with black screen and the raspberry 
> icon at the top-left corner.
> 
> We're aware they have changed the RAM chips (from Samsung to Elpida) and 
> likely we should update the drivers with the new ones.
> 
> Here the buildroot related question: is it possible to change something 
> in the current sd-card image instead of updating and rebuilding the 
> whole system?

You can try to exchange only the firmware, device tree and the linux
kernel files on the first partition of the sd-card image with ones from
an actual build (after testing if the actual complete sd-card image
boots well)...

Regards,
Peter

> 
> This is because if we need to go with the second option we're going to 
> deeply upgrade the application and this is not affordable right now.
> 
> Of course, feel free to ask any details you need to try to help me!
> 
> Thanks in advance!
> Marco
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
