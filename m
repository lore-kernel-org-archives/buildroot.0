From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 18:06:23 +0100
Subject: [Buildroot] [PATCH v3] arch: add support for "jaguar" AMD CPU
 optimisations.
In-Reply-To: <828938079.582663.1389643754921.JavaMail.root@mail>
References: <828938079.582663.1389643754921.JavaMail.root@mail>
Message-ID: <52D56E8F.3000100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 21:09, Adrien B?raud wrote:
> AMD Jaguar (https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29  ) is suddenly
> a popular architecture since it is used in the PS4 and the XBox One.
> Many embedded systems are also likely to use it in the next years.
>
> This patch adds support for GCC architecture-specific optimizations and tuning for these CPUs.
> These optimizations are available with GCC 4.8+.

  You'll also need to update the dependencies of 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_*


  Regards,
  Arnout

>
> Signed-off-by: Adrien Beraud<adrien.beraud@savoirfairelinux.com>

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
