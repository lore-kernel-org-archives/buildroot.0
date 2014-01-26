From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jan 2014 07:37:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-08
In-Reply-To: <52D4E04B.7020700@mind.be>
References: <20140109073009.A1897100CCB@stock.ovh.net>
 <20140109191427.GB3713@free.fr> <20140110072938.27628d13@skate>
 <20140111231717.GD3391@free.fr> <52D4E04B.7020700@mind.be>
Message-ID: <20140126073746.17723e9c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 Jan 2014 07:59:23 +0100, Arnout Vandecappelle wrote:

> > I really don't know what is best to do. I think I'll do the above and
> > try to get the patch upstreamed. Let's see what hey think about it.
> 
>   What should definitely be upstreamable, is to add a cache variable for 
> this option. Then we can set the cache variable from buildroot like we do 
> for so many other things already.

Yes, that is usually the right solution for this type of problem. It
allows to tell configure that we know what we're doing :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
