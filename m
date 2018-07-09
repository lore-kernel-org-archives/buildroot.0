From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Jul 2018 00:58:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/tar: bump version to 1.30
References: <20180709224218.32080-1-bernd.kuhls@t-online.de>
Message-ID: <nt5d1fx9al.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 10 Jul 2018 00:42:18 +0200 schrieb Bernd Kuhls:

> Added license hash.
> 
> Signed-off-by: Bernd Kuhls
> <bernd.kuhls@t-online.de>
> ---
>  package/tar/tar.hash | 5 +++--
>  package/tar/tar.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Hi,

marked the patch as rejected on patchworks after I found

https://git.buildroot.net/buildroot/commit/support/dependencies/check-
host-tar.sh?id=b8fa273d500b44153e9939f0a100e97db2ff63ed

Sorry for the noise.

Regards, Bernd
