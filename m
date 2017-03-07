From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Tue, 7 Mar 2017 14:59:18 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
In-Reply-To: <47dd2cff-1296-4c41-20d0-738fcce26b6b@mind.be>
References: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
 <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
 <20170306165720.28face21@armant.office.greenbone.net>
 <4dccae11-d7e8-1dd8-2797-1336326fa392@mind.be>
 <20170307094050.3ee1650a@armant.office.greenbone.net>
 <47dd2cff-1296-4c41-20d0-738fcce26b6b@mind.be>
Message-ID: <20170307145918.397d5209@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 7 Mar 2017 11:31:48 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 07-03-17 09:40, Beno?t Allard wrote:
> 
> > The following files are actually extracted from the GNU C library:
> > ./lib/strcspn.c: GPL
> > ./lib/stpcpy.c: GPL
> > ./lib/strtoull.c: GPL
> > ./lib/putenv.c: GPL
> > ./lib/strtol.c: GPL
> > ./lib/memcmp.c: GPL
> > ./lib/stpncpy.c: GPL
> > ./lib/memchr.c: GPL
> > ./lib/utime.c: GPL
> > ./lib/utimens.c: GPL
> > ./lib/memchr2.c: GPL
> 
>  Something wrong with your version of licensecheck, because they
> clearly state "version 3 or any later version". My licensecheck (sid,
> 3.0.29-1) correctly identifies them as GPLv3+.
> 

Ok, great, thanks for checking ! I indeed used an older version of the
script (jessie). With that cleared, please consider reviewing the v2 of
my patch :)

Regards,
Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170307/0d197aa7/attachment.asc>
