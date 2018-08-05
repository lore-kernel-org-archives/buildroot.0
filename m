From: Daniel Nicoletti <dantti12@gmail.com>
Date: Sun, 5 Aug 2018 12:31:57 -0300
Subject: [Buildroot] [PATCH] package/cutelyst: Update micro version for
 build fix
In-Reply-To: <20180802154726.46faa9d7@windsurf.home>
References: <20180802133813.12698-1-dantti12@gmail.com>
 <20180802154726.46faa9d7@windsurf.home>
Message-ID: <CACo8zOc4NmY_rYuiBC3nAfNrxmQ15z+OzPuEgQ9dVXfGk2nrGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Em qui, 2 de ago de 2018 ?s 10:47, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> escreveu:
>
> Hello,
>
> Thanks for this update!
>
> On Thu,  2 Aug 2018 10:38:13 -0300, Daniel Nicoletti wrote:
> > Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
>
> If this is fixing a build issue reported by the autobuilders, please
> include in your commit log something like this:
>
> """
> Fixes:
>
>   http://autobuild.buildroot.net/results/13442b0f6be7faaa2a188b9ae4fe3336e2614687/
> """
>
> (Of course, use the correct hash, I just took a random build results to
> illustrate here.)
Should all build failures be included or just one with the problem?
This fixes the same issue in both:
         arm |                 cutelyst-2.5.1 |
http://autobuild.buildroot.net/results/90c56e4e001daa71efd92c926fe3a5dc5ec759e7
         arc |                 cutelyst-2.5.1 |
http://autobuild.buildroot.net/results/01933cfc6ef8eea890e3b6c870c7d6cada7db5ee

This here has a new error:
        i686 |                 cutelyst-2.5.1 |
http://autobuild.buildroot.net/results/d38411eda9edf16e2c40d8931bcfc889faae43dc
I use SO_REUSEPORT but it seems this kernel is old and does not have
support for it

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Daniel Nicoletti

KDE Developer - http://dantti.wordpress.com
