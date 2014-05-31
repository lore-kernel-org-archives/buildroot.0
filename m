From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 31 May 2014 09:35:51 +0200
Subject: [Buildroot] busybox-savedefconfig no rule to make target
In-Reply-To: <874n06769i.fsf@dell.be.48ers.dk>
References: <CA+TH9VkoFTiwFNwKeutQN5oCmU+y5MbpkFYF+qBbCvkV2urS3A@mail.gmail.com>
 <874n06769i.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VmtHXcT13iENGGyoFFuhbNjcPh70WC1SB4ns6CmtoYbAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Peter,

Thank you for the kindly reply and for your time!

Sincerly, Angelo

2014-05-31 9:32 GMT+02:00 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > Hi guys,
>  > The manual says:
>
>  > "busybox-menuconfig and busybox-savedefconfig ony work when busybox is enabled;"
>
>  > I have busybox enabled, I modified the configuration with
>  > busybox-menuconfig, saving the configuration raise this error:
>
>  > make -C /home/angelo/DEV/BUILDROOT/buildroot
>  > O=/home/angelo/DEV/BUILDROOT/br_ariag25_14_2/. busybox-savedefconfig
>  > make[1]: *** No rule to make target `busybox-savedefconfig'.  Stop.
>  > make: *** [_all] Error 2
>
>  > Is this a bug?
>
> Kind of. It is a mistake in the manual. Upstream busybox doesn't have a
> 'savedefconfig' make target to generate a minimal config, so we also
> don't provide a busybox-savedefconfig.
>
> I will fix the manual, thanks!
>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
