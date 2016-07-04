From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 15:08:33 +0200
Subject: [Buildroot] [PATCH 1/3] package/go-bootstrap: Build host tools
	with host CC
In-Reply-To: <c3671ab3-be2e-e2b5-c29e-cf849cc96a5d@gmail.com> (Romain Naour's
 message of "Mon, 4 Jul 2016 11:40:08 +0200")
References: <cover.1463696779.git.geoff@infradead.org>
 <78eb610ef2c82ae5c2adb5be9309401eeffe8cfb.1463696779.git.geoff@infradead.org>
 <c3671ab3-be2e-e2b5-c29e-cf849cc96a5d@gmail.com>
Message-ID: <87furph7ou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Hi Geoff,
 > Le 20/05/2016 ? 00:33, Geoff Levand a ?crit :
 >> Use the host compiler when building host tools.
 >> 
 >> The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
 >> here.  See https://github.com/golang/go/issues/11685.
 >> 
 >> Signed-off-by: Geoff Levand <geoff@infradead.org>

 > Reviewed-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
