From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:17:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/glmark2: remove unneeded comment
In-Reply-To: <1461576857-25683-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 25 Apr 2016 11:34:16 +0200")
References: <1461576857-25683-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <877fflpkfz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > glmark2 depends on mesa3d which already depends on BR2_INSTALL_LIBSTDCPP
 > and BR2_TOOLCHAIN_HAS_THREADS_NPTL, glmark2 does not depend on udev so
 > the comment stating all these dependencies is not needed.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
