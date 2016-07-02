From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 2 Jul 2016 17:16:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/boost: boost-local needs NTPL
 threads
In-Reply-To: <ng0l4dx0de.ln2@ID-313208.user.individual.net>
References: <1467469950-11984-1-git-send-email-romain.naour@smile.fr>
 <ng0l4dx0de.ln2@ID-313208.user.individual.net>
Message-ID: <0c77d26a-d98c-372b-fbd0-2e3fb6422183@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 02/07/2016 ? 16:43, Bernd Kuhls a ?crit :
> Hi Romain,
> 
> Am Sat, 02 Jul 2016 16:32:29 +0200 schrieb Romain Naour:
> 
>> Since Boost 1.61.0 boost-local require a toolchain with NTPL threads
>> support.
> 
> NAK, the Cortex m4 toolchain is broken, not boost:
> http://lists.busybox.net/pipermail/buildroot/2016-June/163865.html

Thanks for the link.
I guess the patch 2/2 has the same issue on NTPL requirement.
Still we probably need the library handling in the packaging.

Is the patch from Waldemar has been merged upstream ?
For now, can we add an autobuilder exception ?

I'll mark the series rejected.

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
