From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:03:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd-bootchart: needs
 headers >= 3.17
In-Reply-To: <1471108019-21603-1-git-send-email-yann.morin.1998@free.fr>
References: <1471108019-21603-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160814160331.3c425beb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Aug 2016 19:06:58 +0200, Yann E. MORIN wrote:
> It uses GRND_NONBLOCK, introduced in 3.17.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/systemd-bootchart/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
