From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 05 Dec 2015 01:45:15 +0100
Subject: [Buildroot] [PATCH v1] assimp: new package
In-Reply-To: <1449272047-15249-1-git-send-email-ps.report@gmx.net>
References: <1449272047-15249-1-git-send-email-ps.report@gmx.net>
Message-ID: <1449276315.7016.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sa, 2015-12-05 at 00:34 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> Any nicer way to define _SOURCE and _SITE to get assimp-3.2.tar.gz
> instead of v3.2.tar.gz file in the local download diretory?

Why not use the github helper?

ASSIMP_VERSION = v3.2
ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))

Best regards
J?rg Krause
