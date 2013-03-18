From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 18 Mar 2013 16:39:10 +0000
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
In-Reply-To: <20130318152706.GV5654@sapphire.tkos.co.il>
References: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
 <20130318152706.GV5654@sapphire.tkos.co.il>
Message-ID: <CAHt8ZCPDT1AkpKfCd019ihM6t8n=y=2PS8-HuBBox=xpY0TbRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 18 March 2013 15:27, Baruch Siach <baruch@tkos.co.il> wrote:
>>  config BR2_PACKAGE_ZEROMQ
>>       bool "zeromq"
>> -     depends on BR2_INSTALL_LIBSTDCPP
>
> Although only the C binding is bundled with zeromq, the library itself seems
> to be implemented in C++, so this is not correct.

Ah, yes. Thanks for pointing that out. Will fix in the next iteration.

Simon
