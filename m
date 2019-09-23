From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:26:00 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/protobuf-c: bump to
 version 1.3.2
In-Reply-To: <20190820184804.28911-3-fontaine.fabrice@gmail.com>
References: <20190820184804.28911-1-fontaine.fabrice@gmail.com>
 <20190820184804.28911-3-fontaine.fabrice@gmail.com>
Message-ID: <20190923232600.73e38eeb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Aug 2019 20:48:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove both patches (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Add-std-to-some-types.patch          | 110 ------------
>  .../0002-Fix-build-with-protobuf-3.6.x.patch  | 160 ------------------
>  package/protobuf-c/protobuf-c.hash            |   3 +-
>  package/protobuf-c/protobuf-c.mk              |   2 +-
>  4 files changed, 3 insertions(+), 272 deletions(-)
>  delete mode 100644 package/protobuf-c/0001-Add-std-to-some-types.patch
>  delete mode 100644 package/protobuf-c/0002-Fix-build-with-protobuf-3.6.x.patch

Same here: another patch was sent later, and this later patch was
applied instead of yours. Sorry about that :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
