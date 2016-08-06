From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 12:13:22 +0200
Subject: [Buildroot] [PATCH] package/ncdu: needs MMU
In-Reply-To: <1470477480-10166-1-git-send-email-yann.morin.1998@free.fr>
References: <1470477480-10166-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160806121322.01769262@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 11:58:00 +0200, Yann E. MORIN wrote:
> It uses the system() function, which calls fork().
> 
> Fixes:
>     http://autobuild.buildroot.org/results/642/642f408d384a32033a677d56e6e3cdf572bd798b/
>     http://autobuild.buildroot.org/results/026/026657e624928ed6bede5719f96c2eee797076cf/
>     http://autobuild.buildroot.org/results/86b/86b66ed92fb714795ba70c228d4d448a1b61cee0/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/ncdu/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
