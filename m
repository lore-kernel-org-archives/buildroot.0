From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:44:05 +0200
Subject: [Buildroot] [PATCH v2] package/elementary: fix parallel install
 issue
In-Reply-To: <1469482680-28281-1-git-send-email-romain.naour@gmail.com>
References: <1469482680-28281-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160727214405.306b8489@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 23:38:00 +0200, Romain Naour wrote:
> There is some *.eo.h files listed in includesub_HEADERS list but
> these files are already installed from elm_eolian_files list.
> 
> Use AUTORECONF and GETTEXTIZE to regenerate the configure script.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7e9/7e9caffe442dcf40ee41da56fd3f55ffedf3a291
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: reword the patch commit log (Yann E. MORIN)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
