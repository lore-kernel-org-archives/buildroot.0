From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 04:15:26 +0100
Subject: [Buildroot] [PATCH 16/18] toolchain-external: add Sourcery
 CodeBench x86 2012.03
In-Reply-To: <0fb2f4844c35414a5834f06bcce989451ed03621.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <0fb2f4844c35414a5834f06bcce989451ed03621.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095DDCE.2020608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:48, Thomas Petazzoni wrote:
> +	  Note that due to the upgrade to glibc 2.15, this toolchain
> +	  no longer provides RPC functions. The TI-RPC library should
> +	  be used instead, but isn't available in Buildroot yet.

  This isn't true anymore...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
