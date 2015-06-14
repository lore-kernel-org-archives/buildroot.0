From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:51:47 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc: use uClibc-ng by default
In-Reply-To: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614145147.3df484c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jun 2015 19:21:45 +0200, Thomas Petazzoni wrote:
> Since the uClibc project is not making any release since about 3
> years, and the uClibc-ng project is now alive and delivering regular
> releases based on uClibc master plus a number of fixes, let's make
> uClibc-ng the default uClibc version used by Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
