From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Mon, 29 Dec 2008 10:01:40 +0000 (GMT)
Subject: [Buildroot] R:  AT91SAM9G20 build .config for linux-2.6.26
In-Reply-To: <49589DCC.30909@soft-in.com>
Message-ID: <999637.34647.qm@web23506.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi

> Hi,
> Thanks.
> 
> I know that, unfortunately, for reasons independent of my
> will, I need
> to stick to version 2.6.26.
> 
> Is there any *easy* way to backport the changes?
> 
> Can someone help me?
> 
> TiA
> Mauro

Apply the two patches of at91sam9g20 to the 2.6.26. You can find in the 
mailing list:

http://lkml.org/lkml/2008/6/13/62

This is the thread I think

Michael



      
