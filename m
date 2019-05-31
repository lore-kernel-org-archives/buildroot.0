From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:26:35 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/opencv3: bump to version
 3.4.6
In-Reply-To: <20190531153555.4444-1-fontaine.fabrice@gmail.com>
References: <20190531153555.4444-1-fontaine.fabrice@gmail.com>
Message-ID: <20190531222635.3bfc0b06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 17:35:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Update hash of license file (update in year:
>   https://github.com/opencv/opencv/commit/14d943f588474cee3cdb8f91e8f7fb7e8af7ad8b)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...otobuf-fix-compilation-issue-on-s390.patch | 38 -------------------
>  package/opencv3/opencv3.hash                  |  4 +-
>  package/opencv3/opencv3.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/opencv3/0001-3rdparty-protobuf-fix-compilation-issue-on-s390.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
