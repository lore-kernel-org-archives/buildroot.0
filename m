From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 19:04:31 +0200
Subject: [Buildroot] [PATCH v4] postgresql: new package
In-Reply-To: <1396642441-4992-1-git-send-email-ps.report@gmx.net>
References: <1396642441-4992-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140420190431.18c03ddb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Fri,  4 Apr 2014 22:14:01 +0200, Peter Seiderer wrote:
> Based on suggested new package by Marco Trapanese ([1]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-February/090661.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied, thanks. However I've made the package only available with
glibc toolchains, since uClibc was causing problems with locales
enabled. Yann E. Morin has reported the uClibc locales bug to the
uClibc developers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
