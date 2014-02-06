From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 6 Feb 2014 09:25:07 +0100 (CET)
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <52F2BE9C.1060204@mind.be>
Message-ID: <1382697342.5095076.1391675107245.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




----- Mail original -----
> On 04/02/14 15:12, J?r?my Rosen wrote:
> > When it is set, BR2_DEFCONFIG is saved like any config variable.
> > However, at this point it is a completely expanded, absolute path
> > It is not a good idea to save absolute paths in defconfig files
> > moreover it makes little sense to save the defconfig location
> > within the defconfig
> > 
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> 
>  Jeremy, I guess this patch is superseded by mine?
> 
yes, I should have pointed that out, sorry
