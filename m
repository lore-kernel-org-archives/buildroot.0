From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 1 Jan 2018 21:16:46 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: build shared and static library
In-Reply-To: <20180101120448.6badab8a@windsurf>
References: <20171231162933.19446-1-fontaine.fabrice@gmail.com>
 <20171231175621.44c67b85@windsurf>
 <CAPi7W83cQCMig324jhj8uyM5a=3Reh11BbbQ25KjhwDEhvqcyQ@mail.gmail.com>
 <20180101120448.6badab8a@windsurf>
Message-ID: <CAPi7W82RO2hJUeqB9i+2y6YmAe6uoX_zRzipgvFX8U993=jQ8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello and happy new year,,

2018-01-01 12:04 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> Happy New Year!
>
> On Sun, 31 Dec 2017 18:19:34 +0100, Fabrice Fontaine wrote:
>
> > > How is BR2_STATIC_LIBS=y handled ?
> > >
> > If BUILD_SHARED_AND_STATIC_LIBS is not set, cjson uses the standard
> > BUILD_SHARED_LIBS option which is passed to OFF by buildroot if
> > BR2_STATIC_LIBS is set.
>
> When you say "If BUILD_SHARED_AND_STATIC_LIBS is not set", do you mean
> BUILD_SHARED_AND_STATIC_LIBS=OFF or "no value is passed for
> BUILD_SHARED_AND_STATIC_LIBS" ?
>
I mean BUILD_SHARED_AND_STATIC_LIBS=OFF.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180101/bd90e3ca/attachment.html>
