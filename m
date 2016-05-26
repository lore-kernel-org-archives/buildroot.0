From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:14:13 +0200
Subject: [Buildroot] [PATCH v3 0/6] Fixes for go language support
In-Reply-To: <cover.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
Message-ID: <20160526211413.2307341d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 18:21:32 +0000, Geoff Levand wrote:

> Geoff Levand (6):
>       package/go: Build host tools with host CC
>       package/go: Add HOST_GO_TARGET_ENV
>       package/flannel: Use HOST_GO_TARGET_ENV
>       package/go: Add HOST_GO_CGO_ENABLED
>       package/flannel: Add BR2_TOOLCHAIN_HAS_THREADS
>       package/go: Set file timestamp

Thanks, I've applied the series. I made a few changes on two patches
(I'll comment on them directly), and I added an additional patch that
adds double quotes around $(TARGET_CC) and $(TARGET_CXX). Indeed, when
ccache support is enabled, those variables contain two words.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
