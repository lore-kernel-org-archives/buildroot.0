From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 08 Dec 2010 21:55:33 +0100
Subject: [Buildroot] [PATCH 08/17] busybox: move udhcp script from
 skeleton to package
In-Reply-To: <20101208201219.52cbfc37@surf>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-9-git-send-email-llandwerlin@gmail.com>
	<20101208201219.52cbfc37@surf>
Message-ID: <1291841733.24014.159.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mercredi 08 d?cembre 2010 ? 20:12 +0100, Thomas Petazzoni a ?crit :
> On Wed,  8 Dec 2010 10:54:00 +0100
> llandwerlin at gmail.com wrote:
> 
> > From: Lionel Landwerlin <llandwerlin@gmail.com>
> > 
> > Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> > ---
> >  fs/skeleton/usr/share/udhcpc/default.script |   39 ---------------------------
> >  package/busybox/busybox.mk                  |    2 +-
> >  package/busybox/udhcpc.script               |   39 +++++++++++++++++++++++++++
> 
> Why is this needed ?
> 

default.script seems to be a config file related to busybox, why not
manage all the busybox stuff into the busybox package ?

--
Lionel Landwerlin
