From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:07:18 +0200
Subject: [Buildroot] [PATCH] package/libupnpp: bump to version 0.15.0
In-Reply-To: <20160911071240.2705-1-joerg.krause@embedded.rocks>
References: <20160911071240.2705-1-joerg.krause@embedded.rocks>
Message-ID: <20160911230718.364d0611@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 09:12:40 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnpp/libupnpp.hash | 4 ++--
>  package/libupnpp/libupnpp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This update is causing a number of build failures:

  http://autobuild.buildroot.net/?reason=libupnpp-0.15.0

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
