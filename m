From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 May 2017 10:52:17 +0200
Subject: [Buildroot] [PATCH] package/miraclecast: drop legacy
	systemd-kdbus select
In-Reply-To: <20170505205451.4664-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 5 May 2017 22:54:51 +0200")
References: <20170505205451.4664-1-yann.morin.1998@free.fr>
Message-ID: <87wp9uqse6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This options was recently removed and made it to legacy (in 815f7137739)
 > but miraclecast still selects it.

 > miraclecast builds fine without it, it seems, so just drop the select
 > altogether.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
