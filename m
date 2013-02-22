From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 22 Feb 2013 10:57:24 -0800
Subject: [Buildroot] [PATCH] libffi: fix powerpc build breakage
In-Reply-To: <87ip5kdwcm.fsf@dell.be.48ers.dk>
References: <1361552133-16421-1-git-send-email-gustavo@zacarias.com.ar>
 <87ip5kdwcm.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2xbdCA+9RWE117w88W9xefjhXM7b5q3PT1B1XrYzo=HAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, Peter,

2013/2/22 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>  Gustavo> Happens with the latest release when there are no FP registers.
>  Gustavo> Fixes:
>  Gustavo> http://autobuild.buildroot.net/results/bc43261d3ddc9d4c320522563249f4a0695a35a4/
>
> Thanks, but probably it makes more sense to use Gilles' version:
>
> http://sourceware.org/ml/libffi-discuss/2013/msg00079.html
>
Sorry for late notice. I meant to send an email to the list today
about it, but you guys beat me to it.
regards,
Gilles.
