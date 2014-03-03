From: Mike Zick <minimod@morethan.org>
Date: Mon, 3 Mar 2014 09:13:16 -0600
Subject: [Buildroot] Old information on
 http://git.buildroot.net/buildroot/
In-Reply-To: <53149AD2.6060807@carallon.com>
References: <5314950B.9040506@carallon.com>
 <20140303090427.4032b712@core2quad.morethan.org>
 <53149AD2.6060807@carallon.com>
Message-ID: <20140303091316.782e7fe8@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 03 Mar 2014 15:08:02 +0000
Will Wagner <willw@carallon.com> wrote:

> On 03/03/2014 15:04, Mike Zick wrote:
> > On Mon, 03 Mar 2014 14:43:23 +0000
> > Will Wagner <will_wagner@carallon.com> wrote:
> >
> >> Hello,
> >>
> >> I just noticed that there is very old data on the summary page when
> >> browsing git, according to the footer it was generated 06/03/2013.
> >>
> >
> > Try: http://git.buildroot.net/buildroot
> > (No trailing '/' in URL.)
> >
> 
> That's great!
> 
> So I guess the issue is instead that the 'Browse Source' link on the 
> buildroot homepage needs updating to remove the trailing '/'
> 

Probably a 'good enough' (tm) bandaid.

- - - -

web-servers often (normally?) re-direct url/something to url/something/
and then follow the same serving logic.

this one doesn't, it has been reported before, but evidently is hard
for the hosting people to find out why.

Mike
> Thanks
> Will
> 
