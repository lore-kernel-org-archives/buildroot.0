From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:03:40 +0100
Subject: [Buildroot] [PATCH 0/7 v2] dependencies: ensure availability of
 host-tar, cleanups in graphs
In-Reply-To: <cover.1525812011.git.yann.morin.1998@free.fr>
References: <cover.1525812011.git.yann.morin.1998@free.fr>
Message-ID: <20181101220340.0159126a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 22:40:17 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       support/graph-depends: ensure all packages get graphed
>       support/graph-depends: also cut on host-skeleton
>       support/graph-depends: also cut on host-tar

For those ones, I have some concerns, and came up with an alternate
implementation, that I'll be submitting shortly (as we discussed on
IRC).

>       core/package: postpone evaluation of dependency conditions
>       core/package: add possibility to declare download dependencies
>       core/package: add host-tar dependency for downloads from repositories
>       fs: always depend on build host-tar if needed

I've applied those four patches, after tweaking a bit the commit title
and fixing minor typos in the commit logs. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
