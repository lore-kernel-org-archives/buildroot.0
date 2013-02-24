From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Feb 2013 22:53:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-23
In-Reply-To: <201302241638.19487.yann.morin.1998@free.fr>
References: <20130224073422.A0E2C43043B@lolut.humanoidz.org>
 <201302241638.19487.yann.morin.1998@free.fr>
Message-ID: <512A8BEA.4070905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/02/13 16:38, Yann E. MORIN wrote:
> What's so special about mips64el that it does not like v4l2_std_id as an
> unsigned 64-bit value (I've checked the headers, it is an __u64).

  I guess mips64 defines it as an unsigned long instead of unsigned long 
long. unsigned long long could be more than 64 bits.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
