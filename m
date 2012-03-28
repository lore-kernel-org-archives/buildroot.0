From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Mar 2012 22:04:29 +0200
Subject: [Buildroot] [PATCH] openswan: new package
In-Reply-To: <1332889779-27193-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332889779-27193-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201203282204.30908.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 28 March 2012 01:09:39 Gustavo Zacarias wrote:
> +OPENSWAN_MAKEOPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \

 Could you name this variable OPENSWAN_MAKE_OPT?  If we ever get a
MAKETARGETS infrastructure, that's what the variable will be called.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
