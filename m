From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 00:26:47 +0200
Subject: [Buildroot] [PATCH V3 5/5] c-icap-modules: new package
In-Reply-To: <1416322487-14247-6-git-send-email-guillaume.gardet@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-6-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <20150713002647.21a464b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET,

On Tue, 18 Nov 2014 15:54:47 +0100, Guillaume GARDET wrote:
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> 
> ---
>  package/Config.in                        |  1 +
>  package/c-icap-modules/Config.in         |  7 +++++++
>  package/c-icap-modules/c-icap-modules.mk | 27 +++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 package/c-icap-modules/Config.in
>  create mode 100644 package/c-icap-modules/c-icap-modules.mk

I applied your patch, but did quite a few changes before doing so:

    [Thomas:
      - Do not pass custom CFLAGS and remove the hacks on the Makefile:
        since the c-icap-config script is now fixed, it returns correct
        values, and the hacks are no longer needed.
      - Add optional dependency on zlib and berkeleydb.
      - Explicitly disable clamav support.]

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
