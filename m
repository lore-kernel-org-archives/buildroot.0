From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 22:59:08 +0100
Subject: [Buildroot] [PATCH v2] uclibc: fix mkostemp
In-Reply-To: <20181031110948.6791-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Wed, 31 Oct 2018 08:09:48 -0300")
References: <20181031051918.6obvzpncii5dl3lx@sapphire.tkos.co.il>
 <20181031110948.6791-1-casantos@datacom.com.br>
Message-ID: <875zwzuxqr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Pull a patch already submitted upstream[1] that fixes mkostemp when
 > _LARGEFILE64_SOURCE is defined. This is required to prevent failures
 > on eudev[2]:

 >     # udevadm hwdb --update
 >     Failure writing database //etc/udev/hwdb.bin: Invalid argument

 > 1. https://patchwork.ozlabs.org/patch/990045/
 > 2. https://patchwork.ozlabs.org/patch/984848/

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Changes v1->v2:
 > - Fix commit message error reported by Baruch Siach.
 > - Improve example.

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
