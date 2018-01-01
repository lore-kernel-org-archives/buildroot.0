From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 12:04:48 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: build shared and static library
In-Reply-To: <CAPi7W83cQCMig324jhj8uyM5a=3Reh11BbbQ25KjhwDEhvqcyQ@mail.gmail.com>
References: <20171231162933.19446-1-fontaine.fabrice@gmail.com>
 <20171231175621.44c67b85@windsurf>
 <CAPi7W83cQCMig324jhj8uyM5a=3Reh11BbbQ25KjhwDEhvqcyQ@mail.gmail.com>
Message-ID: <20180101120448.6badab8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Happy New Year!

On Sun, 31 Dec 2017 18:19:34 +0100, Fabrice Fontaine wrote:

> > How is BR2_STATIC_LIBS=y handled ?
> >
> If BUILD_SHARED_AND_STATIC_LIBS is not set, cjson uses the standard  
> BUILD_SHARED_LIBS option which is passed to OFF by buildroot if
> BR2_STATIC_LIBS is set.

When you say "If BUILD_SHARED_AND_STATIC_LIBS is not set", do you mean
BUILD_SHARED_AND_STATIC_LIBS=OFF or "no value is passed for
BUILD_SHARED_AND_STATIC_LIBS" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
