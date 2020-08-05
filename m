From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:51:50 +0200
Subject: [Buildroot] [PATCH 1/5] package/systemd: import does not need
 bzip2 and lz4
In-Reply-To: <20200731215345.19212-2-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
 <20200731215345.19212-2-nolange79@gmail.com>
Message-ID: <20200805155150.274eacc4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:53:41 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Those are optional dependencies.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
