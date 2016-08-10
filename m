From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 00:03:56 +0200
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.9
In-Reply-To: <1470796264-19662-1-git-send-email-gustavo@zacarias.com.ar>
References: <1470796264-19662-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160811000356.3f47a546@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 23:31:04 -0300, Gustavo Zacarias wrote:
> Add upstream patch to fix build failure with gcc warnings on.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...configure-don-t-add-Werror-to-build-flags.patch | 28 ++++++++++++++++++++++
>  package/libtasn1/libtasn1.hash                     |  2 +-
>  package/libtasn1/libtasn1.mk                       |  4 +++-
>  3 files changed, 32 insertions(+), 2 deletions(-)
>  create mode 100644 package/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
