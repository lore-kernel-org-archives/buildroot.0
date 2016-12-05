From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:24:54 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <f68f3eba-28f0-a3eb-23bc-4954fc05cbd0@gmail.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
 <20161204212433.GC3433@free.fr>
 <20161204224100.26768191@free-electrons.com>
 <43f11483-2fa1-3191-b5b0-4ccbaad28903@mind.be>
 <f68f3eba-28f0-a3eb-23bc-4954fc05cbd0@gmail.com>
Message-ID: <20161205222454.137bc43e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Dec 2016 22:18:37 +0100, Romain Naour wrote:

> What's about <pkg>_WAF_OPTS ?
> In case of aubio we don't really need to pass --notests for the configure step,
> only for build and staging/target install step.

waf is used for all of the configure, build and install steps. So I
would expect something called WAF_OPTS to be passed at all of these
steps, not only at build/install time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
