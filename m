From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 29 May 2009 09:21:02 +0200
Subject: [Buildroot] Building only toolchain
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
Message-ID: <5f2b60905290021x696e8ec1q5879d38cc8f2477e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/5/29 Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>

>  Hi,
>
>
>
> Is it possible to build only toolchain in buildroot? I tried to search the
> makefiles, but I couldn?t find a target that would do it.  It seems that
> there are some
>
<snipped>
I know this is not directly what you asked for, but do you know about the
crosstool-ng project? It builds both glibc/uClibc based toolchains for
several architectures. I successfully built an ARM toolchain with it a
couple of months ago. Project website:
http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool

> I don?t want to build whole system, but just applications so only toolchain
> is needed and not the whole buildroot. I also like to use the same toolchain
> that was used in buildroot to prevent any problems that might come from
> using different toolchain.
>
I have not tested it myself, but I guess it should be ok to setup Buildroot
to use a crosstool-ng generated external toolchain.
Regards,
Bj?rn Forsman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090529/1879e6b6/attachment.htm>
