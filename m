From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 08:38:11 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: bump to version 2.58.1
In-Reply-To: <20181202172323.GB2649@scaer>
References: <20181014075852.2976-1-fontaine.fabrice@gmail.com>
 <20181202140053.6ed28a05@windsurf.home>
 <20181202172323.GB2649@scaer>
Message-ID: <20181203083811.019c0f5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Dec 2018 18:23:24 +0100, Yann E. MORIN wrote:

>  2- teach pkgconf to replace even more variables. This is not very
>     satisfying, and we won't be able to keep up in the long term. We
>     hould at least teach pkgconf to look for that list in an environment
>     variable, at least, to avoid tweaking the code over-and-over again.

Note that we have a pkg-config bump in the pending patches:
http://patchwork.ozlabs.org/patch/967653/. The bump is quite major, and
potentially affects how pkg-config behaves with variables. It might be
worth testing what happens, and in any case, if a solution is designed,
it should be based on this newer version of pkg-config.

For now, I will revert this libglib2 bump. I'll wait a bit for the dust
to settle, and then I will apply this pkg-config bump, which is another
risky change. The kind of stuff that is good to do early in the
development cycle :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
