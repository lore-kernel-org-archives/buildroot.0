From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jun 2014 21:40:24 +0200
Subject: [Buildroot] [PATCH 04/21] package/tvheadend: bump version
In-Reply-To: <878upfw1td.fsf@dell.be.48ers.dk>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
 <e2187ddfaefbda7a99b3e9f2b149c0cbbb9c12ac.1401658972.git.yann.morin.1998@free.fr>
 <878upfw1td.fsf@dell.be.48ers.dk>
Message-ID: <20140602194024.GB3404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-06-02 21:26 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Lotta fixes all over the tree.
>  > Still no new release... :-/
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/tvheadend/tvheadend.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
>  > index ac4c290..244e129 100644
>  > --- a/package/tvheadend/tvheadend.mk
>  > +++ b/package/tvheadend/tvheadend.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>  
>  > -TVHEADEND_VERSION = 6482d33ba90848018c530018e5c38992b8ac921c
>  > +TVHEADEND_VERSION = 0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5
> 
> Is there something missing from this commit? The patch no longer
> applies:
> 
> http://autobuild.buildroot.net/results/808/808e5bb035ddef09339fe6a4d00147ee29ec2a18/build-end.log

Gah, Ias I said to Gustavo on IRC: I forgot the git rm of the patch and
the git add of the new one... :-(

I'll handle that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
