From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 12:47:17 +0100
Subject: [Buildroot] [PATCH v5 1/1] zbar: new package
In-Reply-To: <1446133771-16014-1-git-send-email-sv99@inbox.ru>
References: <1446133771-16014-1-git-send-email-sv99@inbox.ru>
Message-ID: <20151220124717.3c016071@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

On Thu, 29 Oct 2015 18:49:30 +0300, Viacheslav Volkov wrote:
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> ---
>  Changes v4 -> v5:
>   - add patch description (suggested by Vincent.Riera at imgtec.com)

Applied with a number of changes:

    [Thomas:
     - replace patch 0001 fixing autoreconf by a simpler patch that simply
       drops the -Wall and -Werror flags passed to automake.
     - reformat the two patches using Git
     - drop the "uclibc || glibc" dependency inherited from libv4l, since
       libv4l has now been fixed to build on musl.
     - drop the hook work arounding a build issue around man pages, and
       replace by a patch that completely disables the build/installation
       of documentation.
     - change license to LGPLv2.1+, as noted in the COPYING file.
     - drop --enable-shared=yes, since it is already passed by the
       autotools-package infrastructure]

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
