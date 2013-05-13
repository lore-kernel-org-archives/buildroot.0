From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 13 May 2013 17:29:42 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/2] libtool : bump to version 2.4.2
In-Reply-To: <20130513112730.5ad21c4d@skate>
Message-ID: <1570358723.2368493.1368458982853.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I needed to bump libtool because pulseaudio needed it.

I built my system (including pulseaudio) and tested it, but I didn't 
give it further (enough) thought.

This prbably means that this patch should not go in master but in 
next... It's probably way too late to bump libtool.

I'll do the allyesconfig test and reply with the results when done...

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> Dear J?r?my Rosen,
> 
> On Mon, 13 May 2013 10:57:45 +0200, J?r?my Rosen wrote:
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> > ---
> >  package/libtool/libtool.mk |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> How much testing did you do? Bumping libtool is a very sensitive
> thing,
> because it used for all packages that we autoreconfigure. Therefore,
> I
> believe such a bump should come with results of an
> allyespackageconfig
> build before and after the bump.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 
