From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Jan 2019 09:44:37 +0100
Subject: [Buildroot] [PATCH 1/1] atk: fix static build
In-Reply-To: <CAPi7W82Xe+xCz7hAvT1MxnJB_SFwE50vX6Dp-R=2aoDT-5vRag@mail.gmail.com>
References: <20190110164044.9361-1-fontaine.fabrice@gmail.com>
 <20190111093305.30c6bfcc@windsurf>
 <CAPi7W82Xe+xCz7hAvT1MxnJB_SFwE50vX6Dp-R=2aoDT-5vRag@mail.gmail.com>
Message-ID: <20190111094437.149c4e3d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 09:38:02 +0100, Fabrice Fontaine wrote:

> > Thanks! Does this work properly when BR2_STATIC_SHARED_LIBS=y, i.e when
> > we want both a shared and a static variant of the library to be
> > generated ?  
> Yes, here is an extract of the library function definition from
> https://mesonbuild.com/Reference-manual.html: "Builds a library that
> is either static, shared or both depending on the value of
> default_library user option. You should use this instead of
> shared_library, static_library or both_libraries most of the time."

Great, thanks for the confirmation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
