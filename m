From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:43:06 +0200
Subject: [Buildroot] [PATCH/RFC v2 03/44] package/libcec: bump to
 version 3.0.0
In-Reply-To: <1434292603-12052-4-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
 <1434292603-12052-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614224306.3b1d44b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 16:36:02 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in                     |    2 ++
>  package/libcec/0001-remove-Wno-psabi.patch |   21 ---------------------
>  package/libcec/Config.in                   |    4 ++++
>  package/libcec/libcec.mk                   |   23 +++++++++++++++--------
>  4 files changed, 21 insertions(+), 29 deletions(-)
>  delete mode 100644 package/libcec/0001-remove-Wno-psabi.patch

You really need to add more verbose commit logs:

 - explanation about the gcc 4.5 dependency
 - indicate that we're switch from autotools-package to cmake-package

etc.

A commit log limited to "<pkg>: bump to version <version>" is only OK
if really only the version and hashes are changed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
