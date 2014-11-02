From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 2 Nov 2014 13:11:58 +0200
Subject: [Buildroot] [PATCH] live555: bump to version 2014.11.01
In-Reply-To: <20141102103823.GA4002@free.fr>
References: <3bb2bf1c7c36499239d15955ecb02530a9121bf3.1414912431.git.baruch@tkos.co.il>
 <20141102103823.GA4002@free.fr>
Message-ID: <20141102111158.GJ2358@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Nov 02, 2014 at 11:38:23AM +0100, Yann E. MORIN wrote:
> On 2014-11-02 09:13 +0200, Baruch Siach spake thusly:
> > Also add a hash file. Upstream provides md5 only.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/live555/live555.hash | 2 ++
> >  package/live555/live555.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >  create mode 100644 package/live555/live555.hash
> > 
> > diff --git a/package/live555/live555.hash b/package/live555/live555.hash
> > new file mode 100644
> > index 000000000000..8c3ae63d0335
> > --- /dev/null
> > +++ b/package/live555/live555.hash
> > @@ -0,0 +1,2 @@
> > +# From http://live555.com/liveMedia/public/live555-latest-md5.txt
> > +md5	61ec3927fdff01fdaa831238a857b660	live.2014.11.01.tar.gz
> 
> When only md5 is provided by upstream, we want to add a
> locally-generated stronger hash, like sha256. here's the one I locall
> computed:
> 
> sha256 0896b3b787771496436fd0fad4a6a6905c46d4df50088a412216bf360975ca99 live.2014.11.01.tar.gz

OK. I'll add sha256 in v2.

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
