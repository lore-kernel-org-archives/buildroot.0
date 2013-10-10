From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2013 08:53:49 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
 toolchain
In-Reply-To: <20131009143431.9A85B9B970@busybox.osuosl.org>
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
Message-ID: <52564EFD.10506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 16:06, Peter Korsgaard wrote:
> -config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06
> -	bool "Linaro 2013.06"
> +config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
> +	bool "Linaro 2013.07"

  I believe I asked this before: do we really want to remove external 
toolchains without going through a deprecation cycle? Why do we offer in 
a released buildroot three different Linaro toolchain versions that are 
all gcc 4.8 and that you cannot use anymore three months later?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
