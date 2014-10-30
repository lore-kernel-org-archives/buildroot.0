From: Mike Zick <minimod@morethan.org>
Date: Thu, 30 Oct 2014 05:46:36 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-28
In-Reply-To: <1414653431.5132.3.camel@posteo.de>
References: <20141029073016.28E5B1008B6@stock.ovh.net>
 <1414653431.5132.3.camel@posteo.de>
Message-ID: <20141030054636.0124d5d5@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Oct 2014 08:17:11 +0100
J?rg Krause <jkrause@posteo.de> wrote:

> >      powerpc |                    mp4v2-2.0.0 | NOK |
> > http://autobuild.buildroot.net/results/e93653ccc815c805f4af55910c2995372587e7b4/  
> 
> toolchain error?
>         powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized
>         command line option '-mfloat-Wa,-me500x2'
>         

Run together options.
Or
the compiler was not able to compute subtracting 
'Warn All' from -mfloat.  
;)

Mike
