From: Justin Mark <oilehus@yahoo.com>
Date: Sat, 4 Dec 2010 16:09:00 -0800 (PST)
Subject: [Buildroot] DConf
In-Reply-To: <20101203113536.38481498@surf>
Message-ID: <953244.140.qm@web111110.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, I will work on adding dconf into buildroot, but before doing that, I need to add libgee into buildroot first.

I can build libgee with buildroot in my workspace, how should I submit the patch for review? post the patch here or directly do it from git? Can someone give me some details since I don't know much about git?

thanks,
Justin   

--- On Fri, 12/3/10, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Subject: Re: [Buildroot] DConf
> To: buildroot at busybox.net
> Date: Friday, December 3, 2010, 2:35 AM
> On Thu, 2 Dec 2010 21:39:01 -0800
> (PST)
> Justin Mark <oilehus@yahoo.com>
> wrote:
> 
> > Any plan to add DConf (http://live.gnome.org/dconf) in buildroot?
> 
> I am not aware of any effort to package DConf in Buildroot
> at the
> moment. Looking at the configure.ac, the number of
> dependencies seems
> to be limited, so adding this package shouldn't be very
> difficult.
> 
> I of course encourage you to submit a patch to add this
> package into
> Buildroot. See
> http://buildroot.org/downloads/buildroot.html#autotools-tutorial
> for
> details on how to add an autotools-based package.
> 
> Regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


      
