From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:20:59 +0200
Subject: [Buildroot] [PATCHv2 00/21] Package based 'source', 'legal-info',
 'source-check' and 'external-deps'
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150414102059.5150603e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Apr 2015 18:37:44 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (21):
>   pkg-kconfig: declare phony targets as such
>   fs: declare phony targets as such
>   Makefile: targets are now declared phony by the appropriate
>     infrastructures
>   Makefile: rename TARGETS to PACKAGES
>   fs: add rootfs dependencies to PACKAGES
>   Makefile: use <pkg>-all-legal-info to implement the legal-info target
>   Makefile: simplify show-targets

Applied up to this point.

>   Makefile: use the package infra based external-deps

I've stopped here, because Arnout raised a concern, and I'd like the
concern to be resolved before moving forward with applying the rest of
the series. I've already replied to Arnout's concern, so hopefully it
will be resolved soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
