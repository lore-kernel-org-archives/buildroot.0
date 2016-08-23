From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 14:58:39 +0200
Subject: [Buildroot] [PATCH v5 1/7] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <20160823121950.16826-2-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-2-romain.perier@free-electrons.com>
Message-ID: <20160823145839.13734e26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 14:19:44 +0200, Romain Perier wrote:
> This adds support to pass options to the underlying command that is used
> by downloader. Useful for retrieving data with server-side checking for
> user login or passwords, use a proxy or use specific options for cloning
> a repository via git and hg.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
