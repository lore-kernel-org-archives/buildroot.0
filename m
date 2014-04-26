From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 26 Apr 2014 23:47:01 +0200
Subject: [Buildroot] [PATCH] evemu: bump version to 1.2.0
In-Reply-To: <87eh0kzc1u.fsf@dell.be.48ers.dk>
References: <trinity-1fce5222-5e5e-419c-baab-a89af52a2d58-1398454369404@3capp-gmx-bs30>, 
 <87eh0kzc1u.fsf@dell.be.48ers.dk>
Message-ID: <trinity-d69c2907-312f-4446-b08d-8d5a3a0bcbfa-1398548821493@3capp-gmx-bs17>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

> Gesendet: Samstag, 26. April 2014 um 11:15 Uhr
> Von: "Peter Korsgaard" <jacmet@uclibc.org>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, buildroot at busybox.net
> Betreff: Re: [PATCH] evemu: bump version to 1.2.0
>
> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> 
> Hi,
> 
>  > SOURCE_FILE should be something like "${SYSROOT}/usr/include/linux/input.h", whats the best
>  > way to achieve this (and which buildroot set variable should be uesed)?
>  > - patch make-event-names.py directly with given sysroot path
>  > - patch make-event-names.py to use given environment variable with sysroot path
>  > - ...
> 
> Thanks for the patch. I see there's also another failure:
> 
> http://autobuild.buildroot.net/results/4ec/4ecfbca85ffd5544acad44312166bfcb323283b5/build-end.log
> 
> It seems like the python stuff doesn't work with python3. I guess we
> will need to:
> 
> - Patch make-event-names.py to use python2 instead of python
> - Add a configure flag to disable python support and/or fixup python/ to
>   work with python3
> 
> Care to take a look?

Patch with fixup for make-event-names.py is on the way...

Regards,
Peter

> 
> -- 
> Bye, Peter Korsgaard
> 
