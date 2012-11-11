From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:53:33 +0100
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain
 on target
In-Reply-To: <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50A02C6D.1040105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 23:36, Thomas Petazzoni wrote:
>   config BR2_HAVE_DOCUMENTATION
>   	bool "documentation on the target"
> +	# We no longer want to support a toolchain on the target
> +	depends on BR2_DEPRECATED
>   	help
>   	  Install the documentation, including manual pages and info
>   	  pages, on the target.

  Who, documentation has nothing to do with the toolchain on target!  I can
easily imagine use cases where you want to be able to do 'man tcpdump' on
the target.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
