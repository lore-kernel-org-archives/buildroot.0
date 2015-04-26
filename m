From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:25:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsrtp: bump version to 1.5.2
In-Reply-To: <1430052331-5079-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430052331-5079-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426192531.43987935@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 14:45:31 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> https://github.com/cisco/libsrtp/commit/cae277e4377acc90ef787d09ed0d82968bbe809a
> https://github.com/cisco/libsrtp/commit/b5fad5f893c7f323a8f8e1c512fa48cf6cdb1c8d
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-for-building-on-cross-compiling-the-shar.patch |  139 --------------------
>  ...checks-for-libz-and-libdl-when-OpenSSL-is.patch |   33 -----
>  package/libsrtp/libsrtp.mk                         |    3 +-
>  3 files changed, 1 insertion(+), 174 deletions(-)
>  delete mode 100644 package/libsrtp/0001-Add-support-for-building-on-cross-compiling-the-shar.patch
>  delete mode 100644 package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
