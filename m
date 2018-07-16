From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 16 Jul 2018 22:32:12 +0200
Subject: [Buildroot] [PATCH 00/10] new perl packages
In-Reply-To: <20180716134735.6bbd3696@windsurf>
References: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
 <20180716134735.6bbd3696@windsurf>
Message-ID: <20180716203212.GI10962@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 16, 2018 at 01:47:35PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 12 Jul 2018 23:00:44 +0200, Thomas De Schampheleire wrote:
> 
> > 
> > Thomas De Schampheleire (10):
> >   perl-convert-asn1: new package
> >   perl-crypt-blowfish: new package
> >   perl-crypt-cbc: new package
> >   perl-digest-md5: new package
> >   perl-mime-base64-urlsafe: new package
> >   perl-mojolicious-plugin-authentication: new package
> >   perl-net-ping: new package
> >   perl-net-snmp: new package
> >   perl-net-ssh2: new package
> >   perl-net-telnet: new package
> 
> I have applied. However, the <pkg>_LICENSE variable is missing for some
> packages, and it would be good to add it. This is particularly striking
> for perl-crypt-blowfish, which does have a COPYRIGHT file, so clearly,
> it has some license information.

I guess this is due to the perl CPAN website is not actually reporting the
license. I have previously already found that these perl packages are very
lacking in license details.

I guess that if nothing is mentioned, it is the perl license?
Fran?ois, do you know something about this?

> 
> Could you send follow-up patches to add those license details ?
> 

Yes, I'll check this and send more.

Thanks,
Thomas
