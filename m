From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:34:46 +0200
Subject: [Buildroot] [PATCH 1/1] s6-networking: enable SSL if libressl
 is selected
In-Reply-To: <20170723081602.10562-1-eric.le.bihan.dev@free.fr>
References: <20170723081602.10562-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170724183446.2cc958fc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 10:16:02 +0200, Eric Le Bihan wrote:
> If LibreSSL is selected, enable the associated backend to build the
> s6-tls* tools.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/s6-networking/s6-networking.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
