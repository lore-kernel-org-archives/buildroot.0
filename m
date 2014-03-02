From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 15:08:16 +0100
Subject: [Buildroot] [PATCH v3] configs: add SoCkit defconfig
In-Reply-To: <1393355776-22767-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1393355776-22767-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20140302150816.569f29c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Tue, 25 Feb 2014 14:16:16 -0500, Sebastien Bourdelin wrote:
> This commit introduces initial support for the Arrow SoCkit
> boards, featuring an Altera Cyclone V SoC:
> http://www.altera.com/b/arrow-sockit.html
> 
> It is based on Roman Diouskine's work at
> https://github.com/rndi/buildroot-alt.
> 
> The kernel and the u-boot used is the one developped by the
> rocketboards.org community, as mainline support is not fully
> available yet.
> 
> More info is available in the board/altera/sockit/readme.txt file.

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
