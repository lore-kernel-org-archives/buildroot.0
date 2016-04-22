From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 22:41:35 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <87twits7ju.fsf@dell.be.48ers.dk>
References: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
 <8737qdtn10.fsf@dell.be.48ers.dk>
 <20160422222551.700fdf70@free-electrons.com>
 <87twits7ju.fsf@dell.be.48ers.dk>
Message-ID: <20160422224135.03ff1a8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Apr 2016 22:38:29 +0200, Peter Korsgaard wrote:

> Because of some magic in post-image.sh that looks at the dirname to
> figure out what genimage configuration to use:
> 
> BOARD_DIR="$(dirname $0)"
> BOARD_NAME="$(basename ${BOARD_DIR})"
> GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
> 
> According to git blame this comes from 8dd797a0549869 that you applied
> ;)

Hum, since like my memory starts failing :-/

Thanks for reminding me. Seems a bit tricky, but OK, that's probably
the easiest solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
