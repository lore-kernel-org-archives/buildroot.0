From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:51:59 +0200
Subject: [Buildroot] [PATCH 3/5] package/systemd: remove util-linux
 binaries dependency
In-Reply-To: <20200731215345.19212-4-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
 <20200731215345.19212-4-nolange79@gmail.com>
Message-ID: <20200805155159.43f7a822@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:53:43 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> None of the tools in this set are necessary.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
