From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 18:03:30 +0100
Subject: [Buildroot] [PATCH 5/7] gcc: remove ARC-specific patches
In-Reply-To: <1384262780-12743-6-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
 <1384262780-12743-6-git-send-email-mjonker@synopsys.com>
Message-ID: <52825F62.3080507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 14:26, Mischa Jonker wrote:
> Signed-off-by: Mischa Jonker<mjonker@synopsys.com>
> ---
>   package/gcc/4.8-arc/100-uclibc-conf.patch          |   15 --
>   package/gcc/4.8-arc/301-missing-execinfo_h.patch   |   13 --
>   package/gcc/4.8-arc/302-c99-snprintf.patch         |   13 --
>   .../gcc/4.8-arc/305-libmudflap-susv3-legacy.patch  |   49 -------
>   package/gcc/4.8-arc/disable_gc_sections.patch      |  145 --------------------
>   package/gcc/4.8-arc/fix_branch_out_of_range.patch  |   30 ----
>   6 files changed, 265 deletions(-)
>   delete mode 100644 package/gcc/4.8-arc/100-uclibc-conf.patch
>   delete mode 100644 package/gcc/4.8-arc/301-missing-execinfo_h.patch
>   delete mode 100644 package/gcc/4.8-arc/302-c99-snprintf.patch
>   delete mode 100644 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
>   delete mode 100644 package/gcc/4.8-arc/disable_gc_sections.patch
>   delete mode 100644 package/gcc/4.8-arc/fix_branch_out_of_range.patch

  This one should probably be squashed with 3/7, because that is the 
reason that these patches are no longer used.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
