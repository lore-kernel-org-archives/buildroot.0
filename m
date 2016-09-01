From: Ottavio Campana <o.campana@videotec.com>
Date: Thu, 1 Sep 2016 16:23:57 +0000
Subject: [Buildroot] gsoap and code generation
In-Reply-To: <20160901153710.2bb43fc7@free-electrons.com>
References: <5637116E3E13BE46B0D936BF364783C1F6B573@MAIA.sede.videotec.com>,
 <20160901153710.2bb43fc7@free-electrons.com>
Message-ID: <5637116E3E13BE46B0D936BF364783C1F6B84B@MAIA.sede.videotec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> (Please wrap the lines in your e-mail to a reasonable length, thanks!)

I know, but I have to use a weird webmail... even replying at the bottom is
done by hand....

>> How can I write a script that compiles a tool for the host and the
>> libraries for the target?
>
>You need two variants of the same package: a host variant and a target
>variant, i.e host-gsoap (host variant) and gsoap (target variant).
>
>The former installs the host utilities needed to generate code at build
>time while on the host, and the latter installs the libraries
>cross-compiled for the target.

The fact that I create two files, let's say gsoap.mk and host-gsoap.mk , already
lets buildroot know what to compile with the native compiler and what to build
with the cross-compiler?

Thank you

Ottavio
