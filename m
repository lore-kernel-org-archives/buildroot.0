From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:25:56 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1065867889.672166.1471981841582.JavaMail.zimbra@datacom.ind.br>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <1065867889.672166.1471981841582.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160823222556.5554319d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 16:50:41 -0300 (BRT), Carlos Santos wrote:

> > This is an initial list of Buildroot developers. It has been created
> > semi-automatically by parsing the Git history, and finding the authors
> > of commits with a title like "<foo>: new package". Some additional
> > manual tweaking has been done (merging multiple entries corresponding to
> > the same person, adding some more entries, etc.).  
> ---8<---
> > +N:	Carlos Santos <casantos@datacom.ind.br>
> > +F:	package/gmock/
> > +F:	package/perl-file-util/  
> 
> I can take care of util-linux, too.

Added, even though you haven't made any commits to util-linux yet (I
remember we have 3 patches from you in patchwork on util-linux).

> > +N:	Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
> > +F:	package/libpam-radius-auth/
> > +F:	package/libpam-tacplus/  
> 
> Giovanni does not work at DATACOM anymore. Please replace by casantos at ...

Done, thanks for letting me know!

> ---8<---
> > +N:	Stephan Hoffmann <sho@relinux.de>
> > +F:	package/cache-calibrator/
> > +F:	package/gtest/  
> 
> I'm planing to replace gmock and gtest by "googletest" in the near future, so I could take care of gtest if Stefan does not mind. 

I've added package/gtest/ for you as well. Package assignments are not
exclusive: two developers can express their interest for the same
package. That's why I've chosen the term "developer" and not
"maintainer": it's not a file that really describes "ownership" of
packages, but rather "interest".

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
