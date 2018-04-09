From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:19:40 +0200
Subject: [Buildroot] [PATCH] package/python-yieldfrom: fix licensing info
In-Reply-To: <20180408084000.9379-1-yann.morin.1998@free.fr>
References: <20180408084000.9379-1-yann.morin.1998@free.fr>
Message-ID: <20180409111940.3814b262@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Apr 2018 10:40:00 +0200, Yann E. MORIN wrote:
> There is no file containing the license text. The closest we can use is
> the PKG-INFO file, which contains the license name...
> 
> Fixes:
>     http://autobuild.buildroot.net/results/dff21d63845d3d6a5f78c1000301cdd2104595f4
>     http://autobuild.buildroot.net/results/220e82f555ce6c98b89605bab72c7ea3eea61c66
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-yieldfrom/python-yieldfrom.hash | 2 +-
>  package/python-yieldfrom/python-yieldfrom.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
