From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 14:04:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva: fix mesa3d glx support
In-Reply-To: <20191001060520.1191-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 1 Oct 2019 08:05:20 +0200")
References: <20191001060520.1191-1-bernd.kuhls@t-online.de>
Message-ID: <87mudl6my8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > https://git.buildroot.net/buildroot/commit/package/mesa3d?id=5cb821d5635626b7327d5d704555c412e5ed5a1f
 > added a new option to enable GLX support.

 > This patch adjusts libva to use the new logic.

 > Fixes:
 > http://autobuild.buildroot.net/results/797/79776104e681402c24160be15789fe67bb69f833/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
