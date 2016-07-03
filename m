From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 16:03:46 +0200
Subject: [Buildroot] [PATCH 1/2] Package nfs-utils: Added check for
	OK/FAIL
In-Reply-To: <CAGduivyExAG9aZi4mBmfPK-dTBRga+EWdmXV2FVu_z62OoTONQ@mail.gmail.com>
 (Maxime Hadjinlian's message of "Sun, 3 Jul 2016 15:13:30 +0200")
References: <1456485374-5356-1-git-send-email-universeII@gmx.de>
 <20160701124130.GC25487@free.fr>
 <CAGduivyExAG9aZi4mBmfPK-dTBRga+EWdmXV2FVu_z62OoTONQ@mail.gmail.com>
Message-ID: <87furqx1h9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Andreas, all
 > Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

 > On Fri, Jul 1, 2016 at 2:41 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
 >> Andreas, All,
 >> 
 >> On 2016-02-26 12:16 +0100, Andreas Ehmanns spake thusly:
 >>> Removed unconditional 'done' output when starting
 >>> and stopping the daemons. Instead check return value
 >>> of daemon and print out OK or FAIL.
 >>> 
 >>> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
 >> 
 >> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
