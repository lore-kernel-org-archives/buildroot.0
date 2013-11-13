From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Nov 2013 14:33:47 +0100
Subject: [Buildroot] [PATCH v2] infra: introduce github helper function
In-Reply-To: <CAAXf6LXddF50q9C=PyTVoOSY1x0wC2=RXxd+n6E5MpakxHonYQ@mail.gmail.com>
References: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
 <CAAXf6LXddF50q9C=PyTVoOSY1x0wC2=RXxd+n6E5MpakxHonYQ@mail.gmail.com>
Message-ID: <52837FBB.3010200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/13 14:15, Thomas De Schampheleire wrote:
> Regarding the defconfigs: Arnout suggested adding the $(call github)
> there as well. However, I'm not very fond of that: if you run 'make
> savedefconfig' later it will not be preserved.

 Why would it not be preserved?

 The only real disadvantage is that it looks very ugly:

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,274a66a7bfcbaabb88d63e4eba161965383cc416)/linux-sunxi-274a66a7bfcbaabb88d63e4eba161965383cc416.tar.gz"


 Regards,
 Arnout

> 
> Best regards,
> Thomas


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
