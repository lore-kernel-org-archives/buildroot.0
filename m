From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:49:03 +0100
Subject: [Buildroot] [PATCH 1/4] qextserialport: define
 QEXTSERIALPORT_CONFIGURE_CMDS only once
In-Reply-To: <20161120221329.5827-1-arnout@mind.be>
References: <20161120221329.5827-1-arnout@mind.be>
Message-ID: <20161121224903.1529645c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 23:13:26 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Distinguish qt/qt5 by defining QEXTSERIALPORT_QMAKE, like is done e.g.
> for quazip.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/qextserialport/qextserialport.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

All four patches applied to master. On PATCH 3/4, I've fixed up
0003-pkgconfig.patch to take into account the modified header
installation location.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
