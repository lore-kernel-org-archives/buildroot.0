From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 08:58:31 +0100
Subject: [Buildroot] [PATCH 1/8] package/lttng-tools: fix typo in
 variable name
In-Reply-To: <e23ade0d8a644cbe3967628f9b1b907a9cde3dde.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <e23ade0d8a644cbe3967628f9b1b907a9cde3dde.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171130085831.02fa4e40@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:38 +0100, Yann E. MORIN wrote:
> It's lttng-tools, not lttng-libust. ;-)
> 
> Fixes numerous build failures caused by a late autoreconf:
>     http://autobuild.buildroot.org/results/b84/b84a6e39fcca70c56bfe49d54c385dfe6da82422/
>     etc...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Philippe Proulx <eeppeliteloop@gmail.com>

You had already sent this one, and I already merged it. So I'll mark
that one as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
