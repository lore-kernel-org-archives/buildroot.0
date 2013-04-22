From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 20:40:31 +0200
Subject: [Buildroot] [PATCH 1/7] arc: Add ARC and ARC BE architecture
In-Reply-To: <1366630651-6857-2-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-2-git-send-email-mjonker@synopsys.com>
Message-ID: <5175841F.1040601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 13:37, Mischa Jonker wrote:
> +config BR2_arc
> +	bool "ARC (little endian)"
> +	help
> +	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
> +	  that can be used from deeply embedded to high performance host
> +	  applications. Little endian.

  Wouldn't it make more sense to have explicit BR2_arcel and BR2_arcbe 
symbols that implicitly select BR2_arc, similar to microblaze? that 
avoids mistakes like you made in a later patch :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
