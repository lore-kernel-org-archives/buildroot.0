From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 01:05:44 +0100
Subject: [Buildroot] [PATCH 1/2] Add (Freescale) elftosb host package
In-Reply-To: <1331643131-31435-2-git-send-email-eric.jarrige@armadeus.org>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <1331643131-31435-2-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <201203140105.44719.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 13 March 2012 13:52:10 Eric Jarrige wrote:
> +define HOST_ELFTOSB_CLEAN_CMDS
> +       rm -rf $(@D)/bld/linux
> +       rm -f $(HOST_DIR)/usr/bin/elftosb
> +       rm -f $(HOST_DIR)/usr/bin/keygen
> +       rm -f $(HOST_DIR)/usr/bin/sbtool
> +endef

 These look like UNINSTALL commands, not CLEAN commands.

 Not that it's terribly important.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
