From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Dec 2013 12:20:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: only install one
	firmware file
In-Reply-To: <631bcb8e1ae930cb7502e1f2840f045bfea776da.1386017298.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 2 Dec 2013 21:49:28 +0100")
References: <cover.1386017298.git.yann.morin.1998@free.fr>
 <631bcb8e1ae930cb7502e1f2840f045bfea776da.1386017298.git.yann.morin.1998@free.fr>
Message-ID: <878uw2nptp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Since only one firmware is used to boot the Raspberry Pi, there is no
 > reason to install all of them.

 > Add an option to select what firmware to install.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
