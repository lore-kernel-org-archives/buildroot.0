From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:35:30 +0100
Subject: [Buildroot] [PATCH 1/3] package/openocd: explicitly disable
 unselected adapters
In-Reply-To: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
References: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150103213530.04cfc763@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri,  2 Jan 2015 22:19:26 +0100, Samuel Martin wrote:
> Some adapters are automatically enabled, but may not be built because of
> missing (archecture) dependencies. So, just set the options symetrically.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
