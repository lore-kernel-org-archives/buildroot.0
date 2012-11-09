From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 17:56:51 +0100
Subject: [Buildroot] [PATCH 1/2 v2] xtensa: add support for the Xtensa
 architecture
In-Reply-To: <20121109101959.70d640d5@skate>
References: <509ca3b9.e9c5440a.24b8.24a1@mx.google.com>
 <20121109101959.70d640d5@skate>
Message-ID: <509D35D3.6070607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 10:19, Thomas Petazzoni wrote:
> Unfortunately, the default toolchain configuration for Xtensa doesn't.
> I.e, I tried to build the minimal configuration:
>
> BR2_xtensa=y
> BR2_PACKAGE_LUA=y
> BR2_PACKAGE_LUA_INTERPRETER=y
> BR2_PACKAGE_AVAHI=y
>
> And the build of gcc intermediate fails horribly with pthread errors:

  I get these same error with the default bfin config, and it also breaks
with BR2_PTHREADS_NONE=y


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
