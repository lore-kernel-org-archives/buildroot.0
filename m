From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:09:30 +0200
Subject: [Buildroot] [PATCH v2 1/3] infra: Move --enable/--disable-debug
 to package/Makefile.in
In-Reply-To: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019170930.6cfe86d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 11:59:01 +0200, Bernd Kuhls wrote:
> A lot of packages ignored BR2_ENABLE_DEBUG. This patch simplifies the handling of
> this option by adding the corresponding configure option to the global Makefile
> for target packages.
> 
> For host packages --disable-debug is added to the global Makefile.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Patches 1 and 2 applied. For patch 3, I'm a bit hesitant: there are
only two packages using --disable-gtk-doc-html. Does it really make
sense to factorize that in the package infrastructure?

Cc'ing Yann to get his input, since he Reviewed-by the patc in question.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
