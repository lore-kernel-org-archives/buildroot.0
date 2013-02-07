From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 23:10:29 +0100
Subject: [Buildroot] [PATCH] arch/arm: fix-up the ARM Kconfig warning
In-Reply-To: <1360263888-5806-1-git-send-email-yann.morin.1998@free.fr>
References: <1360263888-5806-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <51142655.5010907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/13 20:04, Yann E. MORIN wrote:
> Kconfig does not accepts that a symbol that is part of a choice
> be affected a default value.

  Weird, I thought I tested this...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
