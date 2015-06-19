From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Jun 2015 00:00:54 +0200
Subject: [Buildroot] [PATCH 1/4] defconfig for warpboard
In-Reply-To: <55848E49.1030304@mind.be>
References: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
 <55848E49.1030304@mind.be>
Message-ID: <55849116.2030306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/19/15 23:48, Arnout Vandecappelle wrote:
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/warpboard/linux-4.0.config"
>  You forgot to include this file in the patch. Please make sure that it's a
> defconfig, not a full config.
> 

 Actually, is there a reason not to use the mxs_defconfig?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
