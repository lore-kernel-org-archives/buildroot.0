From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 11:34:11 +0200
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself to package/davfs2
In-Reply-To: <20180622133326.7528-2-roman.gorbenkov@ens2m.org> (Roman
 Gorbenkov's message of "Fri, 22 Jun 2018 15:33:26 +0200")
References: <20180622133326.7528-1-roman.gorbenkov@ens2m.org>
 <20180622133326.7528-2-roman.gorbenkov@ens2m.org>
Message-ID: <87y3f4frzg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Gorbenkov <roman.gorbenkov@ens2m.org> writes:

 > Signed-off-by: Roman Gorbenkov <roman.gorbenkov@ens2m.org>
 > ---
 >  DEVELOPERS | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index d22ac527fa..85b341e7ce 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1664,6 +1664,9 @@ F:	package/chocolate-doom/
 >  F:	package/irssi/
 >  F:	package/vnstat/
 
 > +N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
 > +F:	package/davfs2/

This should have been part of the commit adding davfs2. I've merged it
with that commit and applied, thanks.

-- 
Bye, Peter Korsgaard
