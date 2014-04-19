From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:53:25 +0200
Subject: [Buildroot] [PATCH] graphs: store and keep intermediate 'dot'
 program for graph-depends
In-Reply-To: <1397938628-16545-1-git-send-email-yann.morin.1998@free.fr>
References: <1397938628-16545-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140419235325.11facae7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 19 Apr 2014 22:17:08 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, graph-depends (and PKG-graph-depends) do not store the
> intermediate 'dot' program.
> 
> Some users would like to get the dot program to be able to further
> customise the generated graphs (eg. modify the layout, colorise some
> of the packages...)
> 
> So, store the intermediate dot program alongside the generated graph.
> 
> Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
