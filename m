From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 22:35:44 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/protobuf: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210305161211.4396-3-giulio.benetti@benettiengineering.com>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-3-giulio.benetti@benettiengineering.com>
Message-ID: <20210314223544.1afdb841@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Mar 2021 17:12:10 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected from binutils bug 21464, since there is no
> workaround, let's disable it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/908/9084cd777aefe0fa8235514c33767d8640ad7a5b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/protobuf/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
