From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 21:59:10 +0200
Subject: [Buildroot] [PATCH v5 6/7] package/amd-catalyst: Add support
 AMD CCCLE
In-Reply-To: <20160823121950.16826-7-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-7-romain.perier@free-electrons.com>
Message-ID: <20160823215910.0ae50be6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 14:19:49 +0200, Romain Perier wrote:
> The AMD Catalyst Linux driver includes a graphical controler center for AMD
> graphics accelerators, called Catalyst Controler Center. This commits
> adds support to install this tool by adding a separated prompt.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---

I've fixed the issues pointed out by Yann, and applied to next. Romain,
Yann, please double check what I have committed and let me know if you
spot any issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
