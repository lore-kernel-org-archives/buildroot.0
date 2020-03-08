From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 22:28:09 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/bearssl: new package
In-Reply-To: <CAPi7W81C80e16KmP9NtobYxpvx1ythYnbGW4eczdbizJsmT2HA@mail.gmail.com>
References: <20200227163042.3723042-1-fontaine.fabrice@gmail.com>
 <20200308162106.706e131f@windsurf.home>
 <CAPi7W81C80e16KmP9NtobYxpvx1ythYnbGW4eczdbizJsmT2HA@mail.gmail.com>
Message-ID: <20200308222809.4e85c148@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Mar 2020 16:33:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Thanks for those tweaks however was it intentional to use = instead of
> += for BEARSSL_TARGETS?
> Due to this change, bearssl will only build the dynamic library with
> BR2_SHARED_STATIC_LIBS.

Gah, yes, indeed, my bad. I pushed a fix. Thanks for the additional
review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
