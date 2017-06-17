From: Alexander Dahl <post@lespocky.de>
Date: Sat, 17 Jun 2017 22:45:50 +0200
Subject: [Buildroot] [PATCH] dropwatch: bump to master and fix site
In-Reply-To: <20170617153810.06022ad8@windsurf.lan>
References: <1497684446-18637-1-git-send-email-post@lespocky.de>
 <20170617153810.06022ad8@windsurf.lan>
Message-ID: <20170617204547.GW31396@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Jun 17, 2017 at 03:38:10PM +0200, Thomas Petazzoni wrote:
> I've applied, after doing a few minor fixes (see below). Also, do you
> think that Neil Horman would be willing to accept our two patches in
> upstream dropwatch?

He said he still maintains and would accept patches. However this is
my first encounter with dropwatch, I just needed it for something and
thought I could send a patch after fixing it anyway, so I can't say
much more about upstream than from only this one mail.

> Patches inside packages should be generated with "git format-patch -N"
> to avoid the 1/2, 2/2 numbering, which quickly becomes out of sync when
> patches are added/removed. Also, I've improved the patch title, which
> was not very informative.

I just took the titles from the old patches filenames. Will try to
remember the -N next time. Thanks for the hint.

> Thanks again!

You're welcome.
Alex

-- 
?With the first link, the chain is forged. The first speech censured, 
the first thought forbidden, the first freedom denied, chains us all 
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170617/b3ae09e0/attachment.asc>
