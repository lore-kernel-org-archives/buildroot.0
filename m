From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 3 May 2013 13:26:05 +0200
Subject: [Buildroot] [PATCH v2 1/3] barebox: add custom version option
In-Reply-To: <87vc70xrou.fsf@dell.be.48ers.dk>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-2-git-send-email-fabio.porcedda@gmail.com>
 <20130501231009.787484f5@skate>
 <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
 <87vc70xrou.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC9yjz114OxeMcMLcfreF8ni79Gu+KMpCgSumWWgpfhdmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 3, 2013 at 12:50 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>
> Hi,
>
>  Fabio> I think it's easier to have a option name that doesn't change.
>  Fabio> If there isn't a specific reason to have a option name that
>  Fabio> changes then I will send a patch to change the linux kernel
>  Fabio> option name.
>
>  Fabio> BR2_LINUX_KERNEL_3_9 -> BR2_LINUX_KERNEL_LATEST_VERSION
>
> Agreed. With the _3_9 option people often don't realize that it will
> only exist for a few months, and that they should use the CUSTOM_VERSION
> stuff to really fix the version.
>
> --
> Bye, Peter Korsgaard

Ok good, I will send a v4 adding that patch.

Best regards
--
Fabio Porcedda
