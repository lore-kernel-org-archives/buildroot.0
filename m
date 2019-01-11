From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 11 Jan 2019 09:38:02 +0100
Subject: [Buildroot] [PATCH 1/1] atk: fix static build
In-Reply-To: <20190111093305.30c6bfcc@windsurf>
References: <20190110164044.9361-1-fontaine.fabrice@gmail.com>
 <20190111093305.30c6bfcc@windsurf>
Message-ID: <CAPi7W82Xe+xCz7hAvT1MxnJB_SFwE50vX6Dp-R=2aoDT-5vRag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le ven. 11 janv. 2019 ? 09:33, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Thu, 10 Jan 2019 17:40:44 +0100, Fabrice Fontaine wrote:
> > Use library instead of shared_library to allow the user to build a
> > static libatk library
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/347a37dd2585974bdbf3bf99158e8ee9127d1202
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks! Does this work properly when BR2_STATIC_SHARED_LIBS=y, i.e when
> we want both a shared and a static variant of the library to be
> generated ?
Yes, here is an extract of the library function definition from
https://mesonbuild.com/Reference-manual.html: "Builds a library that
is either static, shared or both depending on the value of
default_library user option. You should use this instead of
shared_library, static_library or both_libraries most of the time."
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
