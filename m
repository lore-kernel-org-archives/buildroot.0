From: daggs <daggs@gmx.com>
Date: Sat, 11 Jun 2016 06:46:53 +0200
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_2/2_v2=5D_kodi=3A_enable_optional_?=
	=?utf-8?q?dependency_on=09libamcodec?=
In-Reply-To: <5o6r2dxrp2.ln2@ID-313208.user.individual.net>
References: <20160610115151.19226-1-daggs@gmx.com>
 <20160610115151.19226-2-daggs@gmx.com>,
 <5o6r2dxrp2.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-c3fda4ab-7b95-4635-ad06-89c4b3e15c13-1465620413342@3capp-mailcom-bs07>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Am Fri, 10 Jun 2016 14:51:51 +0300 schrieb Dagg Stompler:
> 
> > +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> > +KODI_DEPENDENCIES += libamcodec
> > +KODI_CONF_OPTS += --enable-codec=amcodec
> 
> Hi,
> 
> did you find out whether this option is necessary in the future?
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/150321
> 
> Regards, Bernd
> 

not sure I follow, the change described here is regarding andorid.
unless I'm mistaken, my change only affects linux.
am I wrong?

Dagg.
