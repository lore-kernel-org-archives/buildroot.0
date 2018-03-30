From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:21:20 +0200
Subject: [Buildroot] [PATCH 2/2 v2] support/check-bin-arch: exclude
 kernel modules for merged /usr
In-Reply-To: <9fe26c138652b171d9192c128713c3e6ce989d38.1520459473.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 7 Mar 2018 22:51:24 +0100")
References: <cover.1520459473.git.yann.morin.1998@free.fr>
 <9fe26c138652b171d9192c128713c3e6ce989d38.1520459473.git.yann.morin.1998@free.fr>
Message-ID: <87d0zl1cq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When using a merged /usr, the kernel module path is really
 > /usr/lib/modules, as /lib is a symlink to usr/lib .

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

 > ---
 > Changes v1 -> v2:
 >   - also add it to the manual

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
