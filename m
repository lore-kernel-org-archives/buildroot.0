From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:52:01 +0200
Subject: [Buildroot] [PATCH] package/libarchive: make optional zstd
 dependency explicit
In-Reply-To: <20200407094949.23467-1-patrickdepinguin@gmail.com>
References: <20200407094949.23467-1-patrickdepinguin@gmail.com>
Message-ID: <20200408225201.5d0eedc8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 11:49:49 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Otherwise, the presence of zstd support in libarchive will depend on build
> order.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/libarchive/libarchive.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
