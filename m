From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 12:46:51 +0200
Subject: [Buildroot] [PATCH] package/protobuf-c: bump 1.3.2
In-Reply-To: <20190909163140.63127-1-matthew.weber@rockwellcollins.com>
References: <20190909163140.63127-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190910124651.34ad0bf5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon,  9 Sep 2019 11:31:40 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  .../0001-Add-std-to-some-types.patch          | 110 ------------
>  .../0002-Fix-build-with-protobuf-3.6.x.patch  | 160 ------------------
>  package/protobuf-c/protobuf-c.hash            |   3 +-
>  package/protobuf-c/protobuf-c.mk              |   2 +-
>  4 files changed, 3 insertions(+), 272 deletions(-)
>  delete mode 100644 package/protobuf-c/0001-Add-std-to-some-types.patch
>  delete mode 100644 package/protobuf-c/0002-Fix-build-with-protobuf-3.6.x.patch

I've applied to master, but the commit log could be a bit more verbose:
why are the patches being removed, the license file hash being added.
Also, the commit title is typically "bump to version XYZ", not just
"bump XYZ".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
