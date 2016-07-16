From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 10:13:21 +0200
Subject: [Buildroot] [PATCH] package/xcb-proto: add upstream patch for
 python3.5 build failure v2
In-Reply-To: <1468162196-4488-1-git-send-email-yann.morin.1998@free.fr>
References: <1468162196-4488-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160716101321.2a02f2ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 16:49:56 +0200, Yann E. MORIN wrote:
> Commit 37f0412 (xcb-proto: add upstream patch for python3.5 build
> failure) added an upstream patch to fix building with python3.5, but
> missed another one.
> 
> Add it now.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/b43/b43dc7013feddccaff913cb304d3ecb073ef6112/
>     http://autobuild.buildroot.org/results/7e0/7e08d7ac2eb40033fd928d7c30d9660825964fa3/
>     http://autobuild.buildroot.org/results/ca3/ca35393db46d6b08d3e0e9eaa55ff575c8cf36d7/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  ...print-is-a-function-and-needs-parentheses.patch | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/x11r7/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
