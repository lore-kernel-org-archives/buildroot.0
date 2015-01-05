From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 15:15:25 +0100
Subject: [Buildroot] [PATCH] support/download: further silence the git
 helper
In-Reply-To: <1420395014-8961-1-git-send-email-yann.morin.1998@free.fr>
References: <1420395014-8961-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150105151525.38fadb76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  4 Jan 2015 19:10:14 +0100, Yann E. MORIN wrote:
> We expresely call printf in the git helper, calls which were not
> addresed in the previous silent-build patchset.
> 
> Just redirect stdout to oblivion when being silent.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
