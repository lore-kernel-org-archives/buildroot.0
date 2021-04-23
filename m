From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:19:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgis: add optional
 protobuf-c dependency
In-Reply-To: <20210422182641.654969-1-fontaine.fabrice@gmail.com>
References: <20210422182641.654969-1-fontaine.fabrice@gmail.com>
Message-ID: <20210423231914.5e8c5372@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 20:26:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-cross-compilation-with-protobuf-c.patch | 42 +++++++++++++++++++
>  package/postgis/postgis.mk                    | 10 ++++-
>  2 files changed, 50 insertions(+), 2 deletions(-)
>  create mode 100644 package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
