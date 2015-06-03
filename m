From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Jun 2015 23:04:21 +0200
Subject: [Buildroot] [PATCH 18/32 v2] package/matchbox: finally add
 prompts to all sub-packages
In-Reply-To: <5f4b5cf38761c88677667e03bf7b67f2c699a853.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
 <5f4b5cf38761c88677667e03bf7b67f2c699a853.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <556F6BD5.3060509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 22:41, Yann E. MORIN wrote:
> We currently do not have that many packages without a prompt, and when
> we do, they are limited to system-related packages that can't be
> selected or are forcibly selected under various system-specific
> conditions.
> 
> This is clearly not the case for the matchbox sub-packages, so just give
> them a prompt, even when they are forcibly selected by the main matchbox
> package, and can't be selected without it.
> 
> That will at least tell the user those packages exist and are to be
> built.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
