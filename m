From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 12 Nov 2013 16:29:27 -0600
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <87txfh2r91.fsf@dell.be.48ers.dk>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>	<9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
 <87txfh2r91.fsf@dell.be.48ers.dk>
Message-ID: <OFF1FDA952.899671BE-ON86257C21.007B6370-86257C21.007B8BE5@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@gmail.com> wrote on 11/12/2013 04:24:10 PM:

> From: Peter Korsgaard <jacmet@uclibc.org>
> To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Matt Weber <mlweber1@rockwellcollins.com>, buildroot at busybox.net
> Date: 11/12/2013 04:24 PM
> Subject: Re: [PATCH 1/1] omniorb: add COS Naming Service
> Sent by: Peter Korsgaard <jacmet@gmail.com>
> 
> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> 
writes:
> 
> Hi,
> 
> >> +if BR2_PACKAGE_OMNIORB
> >> +
> >> +config BR2_PACKAGE_OMNIORB_WITH_SERVICES
> >> +        bool "COS Naming Service"
> >> +        default y
> >> +        help
> >> +          omniORB COS Naming Service
> >> +endif
> >> +
> >> comment "omniORB needs a toolchain w/ C++"
> >> depends on !BR2_INSTALL_LIBSTDCPP
> 
> > I think it makes more sense to keep this comment close to the config
> > option it applies to, thus moving the new cos option below it.  I know
> > that many packages do not follow this, but I'm planning on fixing
> > that...
> 
> Careful, kconfig needs sub options to be directly under the main option,
> otherwise they don't get indented correctly in menuconfig, so your
> options are either:

Thanks for the clarification, I was wondering if that was needed.
I just tested moving it above and that seems to be more readable then 
below.

Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/bcb5fdd1/attachment.html>
