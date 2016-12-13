From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 00:02:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/elfutils: add host variant
In-Reply-To: <1477918137-25258-1-git-send-email-yann.morin.1998@free.fr>
References: <20161031074624.7576-10-eeppeliteloop@gmail.com>
 <1477918137-25258-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161214000258.372c1873@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 13:48:56 +0100, Yann E. MORIN wrote:
> elfutils (libelf and libdw) can be used by host-lttng-babeltrace.
> Enable all library dependencies, but don't build the programs.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  package/elfutils/elfutils.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
