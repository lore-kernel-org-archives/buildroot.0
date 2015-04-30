From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:47:17 +0200
Subject: [Buildroot] [v6,08/15] qt5base: apply new patch naming policy
In-Reply-To: <1421451251-23366-9-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-9-git-send-email-jezz@sysmic.org>
Message-ID: <20150430084717.GH24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:04AM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  .../{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch}        | 0
>  .../{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch}        | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/qt5/qt5base/{qt5base-0002-mkspecs-files.patch => 0002-mkspecs-files.patch} (100%)
>  rename package/qt5/qt5base/{qt5base-0003-uclibc-no-lfs.patch => 0003-uclibc-no-lfs.patch} (100%)
> 
> diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/0002-mkspecs-files.patch
> similarity index 100%
> rename from package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> rename to package/qt5/qt5base/0002-mkspecs-files.patch
> diff --git a/package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch b/package/qt5/qt5base/0003-uclibc-no-lfs.patch
> similarity index 100%
> rename from package/qt5/qt5base/qt5base-0003-uclibc-no-lfs.patch
> rename to package/qt5/qt5base/0003-uclibc-no-lfs.patch

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
