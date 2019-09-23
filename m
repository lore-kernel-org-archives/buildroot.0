From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:25:41 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/protobuf: bump to version
 3.9.1
In-Reply-To: <20190820184804.28911-1-fontaine.fabrice@gmail.com>
References: <20190820184804.28911-1-fontaine.fabrice@gmail.com>
Message-ID: <20190923232541.06006e4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Aug 2019 20:48:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ompilation-under-mips-big-endian-wit.patch | 38 -------------------
>  package/protobuf/protobuf.hash                |  2 +-
>  package/protobuf/protobuf.mk                  |  2 +-
>  package/python-protobuf/python-protobuf.hash  |  2 +-
>  4 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/protobuf/0001-Fix-to-allow-a-compilation-under-mips-big-endian-wit.patch

Matt Weber has sent the same version bump later on, and it was merged
instead of your version. Sorry about that :-/ I marked your patch as
Not Applicable in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
