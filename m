From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Nov 2013 13:37:40 +0100
Subject: [Buildroot] [PATCH v2] infra: introduce github helper function
In-Reply-To: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
References: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
Message-ID: <52837294.10305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/13 13:24, Mischa Jonker wrote:
> In order to make it easier to cope with changes in github download-URL's,
> this patch introduces the github helper function. It generates the site
> URL of a github repository. It's usage is $(call github,user,pkg,version).
>
> Cc: Arnout Vandecapelle<arnout@mind.be>
> Cc: Maxime Hadjinlian<maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin<s.martin49@gmail.com>
> Cc: Thomas De Schampheleire<patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Signed-off-by: Mischa Jonker<mjonker@synopsys.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
