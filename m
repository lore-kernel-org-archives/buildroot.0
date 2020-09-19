From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:13:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcap-ng: bump to version 0.8
In-Reply-To: <20200914204717.3461244-1-fontaine.fabrice@gmail.com>
References: <20200914204717.3461244-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919211352.072f8f1b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 22:47:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This release adds support for ambient capabilities and V3 filesystem
> capabilities.
> 
> A bug in the python bindings was also fixed which prevented use of
> capng_updatev.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcap-ng/libcap-ng.hash | 2 +-
>  package/libcap-ng/libcap-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
