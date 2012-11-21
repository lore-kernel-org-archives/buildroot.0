From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2012 07:51:31 +0100
Subject: [Buildroot] [PATCH v3 1/6] snowball-hdmiservice: new package
In-Reply-To: <1352967920-3164-2-git-send-email-gregory.hermant@calao-systems.com>
References: <1352967920-3164-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352967920-3164-2-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50AC79F3.6000807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/12 09:25, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
[snip]
> +
> +define SNOWBALL_HDMISERVICE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
> +endef

  I may have asked this before, but is there a reason to not pass buildroot's
CFLAGS and LDFLAGS?  We usually pass $(TARGET_CONFIGURE_OPTS) to sub-makes.

[snip]


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
