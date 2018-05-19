From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:56:58 +0200
Subject: [Buildroot] [PATCH] librtlsdr: bump to version v0.5.4
In-Reply-To: <20180514140429.23428-1-gwenj@trabucayre.com>
References: <20180514140429.23428-1-gwenj@trabucayre.com>
Message-ID: <20180519225658.706a5067@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 16:04:29 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 

It would have been nice in the commit log to explain why the patch in
package/librtlsdr/ has been dropped.

> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  ...01-disable_shared_library_target_in_build.patch | 80 ----------------------
>  package/librtlsdr/librtlsdr.hash                   |  4 +-
>  package/librtlsdr/librtlsdr.mk                     |  2 +-
>  3 files changed, 4 insertions(+), 82 deletions(-)
>  delete mode 100644 package/librtlsdr/0001-disable_shared_library_target_in_build.patch

But anyway: applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
