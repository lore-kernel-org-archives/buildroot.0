From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 01:33:33 +0100
Subject: [Buildroot] [PATCH 1/2] xtensa: add support for the Xtensa
	architecture
In-Reply-To: <509D9F95.1040806@zankel.net>
References: <509b2947.a6e6440a.547c.7082@mx.google.com>
 <509C1D94.2010107@mind.be> <509D9F95.1040806@zankel.net>
Message-ID: <509DA0DD.3040904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 01:28, Chris Zankel wrote:
> On 11/08/2012 01:01 PM, Arnout Vandecappelle wrote:
>> >  On 11/08/12 04:38, Chris Zankel wrote:
>>> >>     config BR2_USE_MMU
>>> >>  -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh
>>> >>  +	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
>>> >>     	default y if !BR2_bfin
>> >     So the Xtensa, a configurable processor, always has a MMU?
> Good point. Actually, you can configure Xtensa with and without an MMU,
> so I think the above logic is correct. It allows to configure MMU if the
> processor is Xtensa, am I wrong?

  Err, yes, I was misreading the patch... Sorry about that.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
