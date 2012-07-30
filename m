From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 22:19:23 +0200
Subject: [Buildroot] [PATCHv2] libusb: needs thread support
In-Reply-To: <1340847325-4326-1-git-send-email-gustavo@zacarias.com.ar>
References: <1340847325-4326-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120730221923.0f20e236@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 27 Jun 2012 22:35:25 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> libusb needs thread support, and so do other packages that depend on it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

I have added the same dependency on the libnfc-llrp, which had been
added in the mean time, and selects libnfc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
