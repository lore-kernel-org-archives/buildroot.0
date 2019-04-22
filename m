From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:23:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: fix build with gcc < 5.0
In-Reply-To: <20190422173613.5920-1-romain.naour@gmail.com>
References: <20190422173613.5920-1-romain.naour@gmail.com>
Message-ID: <20190422222318.03bd1a77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Apr 2019 19:36:12 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> __has_attribute has been introduced with gcc 5 [1].
> 
> [1] https://www.gnu.org/software/gcc/gcc-5/changes.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/64ab825048fac1654b0d0698740ddf857fcc0afa/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...-add-missing-__has_attribute-definitions-.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/efl/0001-libunibreak-add-missing-__has_attribute-definitions-.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
