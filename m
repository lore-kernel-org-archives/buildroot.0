From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Apr 2014 17:53:00 +0200
Subject: [Buildroot] [PATCH] latencytop: disable static build
In-Reply-To: <4cc42edb1d6c9e7d6c156bb56fb744ec84ff9ae0.1396879234.git.baruch@tkos.co.il>
References: <4cc42edb1d6c9e7d6c156bb56fb744ec84ff9ae0.1396879234.git.baruch@tkos.co.il>
Message-ID: <20140407175300.4b6111f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon,  7 Apr 2014 17:00:34 +0300, Baruch Siach wrote:
> The Makefile of latencytop doesn't take static linking into account when
> calling pkg-config for glib-2.0. Disable static build of latencytop.

Well, there are *lots* of packages that don't take into account static
linking with pkg-config. There is even a patch proposed to improve this
situation: http://patchwork.ozlabs.org/patch/326741/.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
