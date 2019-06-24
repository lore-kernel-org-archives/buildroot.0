From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:13:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/harfbuzz: fix build without
 cairo-svg
In-Reply-To: <20190623190309.61714-1-james.hilliard1@gmail.com>
References: <20190623190309.61714-1-james.hilliard1@gmail.com>
Message-ID: <20190624061305.62a4e523@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 13:03:09 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.org/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556
> test-ot-color.cc:40:10: fatal error: cairo-svg.h: No such file or directory
>    40 | #include <cairo-svg.h>
>       |          ^~~~~~~~~~~~~
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...airo-svg-dependency-to-test-ot-color.patch | 38 +++++++++++++++++++
>  package/harfbuzz/harfbuzz.mk                  |  2 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
