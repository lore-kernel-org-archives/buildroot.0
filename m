From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Jun 2015 06:02:07 +0300
Subject: [Buildroot] [PATCH 1/1] Package Additions: tpm-tools and
	TrouSers
In-Reply-To: <556E29F4.7050500@mind.be>
References: <DB5PR03MB119252B7F9517E39F5DD8548CEB50@DB5PR03MB1192.eurprd03.prod.outlook.com>
 <556E29F4.7050500@mind.be>
Message-ID: <20150603030207.GV2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Jun 03, 2015 at 12:11:00AM +0200, Arnout Vandecappelle wrote:
> On 06/02/15 11:15, Al West wrote:
> > diff --git a/package/tpm-tools/tpm-tools.hash b/package/tpm-tools/tpm-tools.hash
> > new file mode 100644
> > index 0000000..bdd66da
> > --- /dev/null
> > +++ b/package/tpm-tools/tpm-tools.hash
> > @@ -0,0 +1,2 @@
> > +# http://sourceforge.net/projects/trousers/files/tpm-tools/
> 
>  You should only mention a link here if it has the hash. In this case, just say
> 
> # Locally calculated

Actually there are md5 and sha1 hashes (but no sha256) at 
http://sourceforge.net/projects/trousers/files/tpm-tools/1.3.8/. Just click on 
the "i" icon.

> > +sha256	66eb4ff095542403db6b4bd4b574e8a5c08084fe4e9e5aa9a829ee84e20bea83  tpm-tools-1.3.8.tar.gz

[...]

> > diff --git a/package/trousers/trousers.hash b/package/trousers/trousers.hash
> > new file mode 100644
> > index 0000000..86d08a7
> > --- /dev/null
> > +++ b/package/trousers/trousers.hash
> > @@ -0,0 +1,3 @@
> > +# http://sourceforge.net/projects/trousers/files/trousers/
> 
>  # Locally calculated

Ditto, at http://sourceforge.net/projects/trousers/files/trousers/0.3.13/.

> > +sha256	bb908e4a3c88a17b247a4fc8e0fff3419d8a13170fe7bdfbe0e2c5c082a276d3  trousers-0.3.13.tar.gz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
