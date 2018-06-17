From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:54:36 +0200
Subject: [Buildroot] [PATCH] libtirpc: use rpcgen from host-nfs-utils
In-Reply-To: <571a2cfbd7742f799f4deefdae122188152b70fc.1526645810.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 18 May 2018 15:16:50 +0300")
References: <571a2cfbd7742f799f4deefdae122188152b70fc.1526645810.git.baruch@tkos.co.il>
Message-ID: <87efh5v4yb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop the patch adding local rpcgen. Instead use the host-nfs-utils
 > provided rpcgen. Update the patch "Automatically generate XDR header
 > files from .x sources using" to use external rpcgen.

 > Renumber the other patches.

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---

 > This depends on the patch adding host-nfs-utils.

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
