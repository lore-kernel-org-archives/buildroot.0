From: =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@freescale.com>
Date: Wed, 12 Mar 2014 15:11:35 +0100
Subject: [Buildroot] host-fakeroot archive not sourced any more?
In-Reply-To: <CAHkwnC99ifVpDJPBnMD+4rsWcykfMf2U4KTrtZRYqpkRVUfy1w@mail.gmail.com>
References: <532033B2.9030903@freescale.com>
 <CAAXf6LXkv15AhY+2GaBG6pxgs0TpgX3SiY_EQP1Se4X5P2SwDA@mail.gmail.com>
 <CAHkwnC_XBGoHGKVaTuS5_U601uASbzxwP-wF2X5Po6Ezo-PJAw@mail.gmail.com>
 <CAHkwnC99ifVpDJPBnMD+4rsWcykfMf2U4KTrtZRYqpkRVUfy1w@mail.gmail.com>
Message-ID: <53206B17.2000409@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/2014 01:44 PM, Fabio Porcedda wrote:
> -               $(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
> +               $(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS)
> $(TARGETS_ROOTFS))),\

Hi Fabio,

Thanks for the patch; I confirm it repairs fakeroot fetching. I'll start 
to use it instead of the reverts and see how it goes.

Best regards,

V.
