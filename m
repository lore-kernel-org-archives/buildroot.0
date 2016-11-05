From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 5 Nov 2016 09:55:59 -0400
Subject: [Buildroot] [PATCH] get-developers: fix parentheses for print
In-Reply-To: <20161105115144.43a467f2@free-electrons.com>
References: <20161105041000.22455-1-gael.portay@savoirfairelinux.com>
 <20161105115144.43a467f2@free-electrons.com>
Message-ID: <20161105135559.GA8468@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Nov 05, 2016 at 11:51:44AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  5 Nov 2016 00:10:00 -0400, Ga?l PORTAY wrote:
> > Python3 complains about missing parentheses.
> > 
> > $ ./support/scripts/get-developers
> >   File "./support/scripts/get-developers", line 45
> >     print f
> >           ^
> > SyntaxError: Missing parentheses in call to 'print'
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  support/scripts/get-developers | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks.
> 

Thanks!

Ga?l
