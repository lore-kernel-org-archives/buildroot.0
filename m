From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:42:58 +0100
Subject: [Buildroot] [PATCH v2 4/6] package/gnuradio: add python3 support
In-Reply-To: <20200117110232.31336-4-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
 <20200117110232.31336-4-gwenj@trabucayre.com>
Message-ID: <20200203234258.03f88411@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jan 2020 12:02:30 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gnuradio 3.8.0.0 support both python2 and python3.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

You forgot to drop the depends on !BR2_PACKAGE_PYTHON3 on the gnuradio
option... if you don't remove it, we still can't build gnuradio with
python3 enabled. So I've dropped it when applying.

Thanks!

Thomas

-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
