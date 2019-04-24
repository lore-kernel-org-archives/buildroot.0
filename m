From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnspr:add nds32 support
 patches
In-Reply-To: <20190424104402.15468-2-nylon7@andestech.com>
References: <20190424104402.15468-1-nylon7@andestech.com>
 <20190424104402.15468-2-nylon7@andestech.com>
Message-ID: <20190424220337.2e1471f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Apr 2019 18:44:02 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> libnspr 4.20 didn't support nds32 architecture lead to build error
> 
> Fixes:
>   http://autobuild.buildroot.net/results/9380435440c977eeaf98a1ffa80f411f07f62482/
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  package/libnspr/0003-nds32.patch | 75 ++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 package/libnspr/0003-nds32.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
