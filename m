From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 15 Jan 2014 13:25:12 +0100
Subject: [Buildroot] [PATCH v11 2/8] package: add toolchain dependency
 to every target package
In-Reply-To: <CAHXCMM+=hgEKtMQ2Bodb4K+n4=Mxzv0P06w0-8Gu4fXr02fixg@mail.gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
 <1389348368-2509-3-git-send-email-fabio.porcedda@gmail.com>
 <CAHXCMM+=hgEKtMQ2Bodb4K+n4=Mxzv0P06w0-8Gu4fXr02fixg@mail.gmail.com>
Message-ID: <CAHkwnC_qTEG7SKFj0PxdnnbPLAJd8_zreAWWNBTgc+HjTRDWgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 10, 2014 at 12:01 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Fabio, all,
>
>
> 2014/1/10 Fabio Porcedda <fabio.porcedda@gmail.com>
>>
>> This commit makes the dependency from the target toolchain explicit.
>> This way we can buid from command line a package that use
>> innger-generic-package right after the configuration phase, example:
>
> s/innger-generic-package/inner-generic-package/
> (just nitpicking ;-))

Thanks for fixing the typo.

<snip>

Regards
-- 
Fabio Porcedda
