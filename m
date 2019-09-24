From: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
Date: Tue, 24 Sep 2019 09:22:37 +0200
Subject: [Buildroot] [PATCH] libhttpserver: new package
In-Reply-To: <20190923155623.711a3539@windsurf>
References: <20190923115237.4524-1-stephan.hoffmann@ext.grandcentrix.net>
 <20190923155623.711a3539@windsurf>
Message-ID: <CADGPgeAthWJO_LokTuri+513d0nTeAvzvFqv6z4EeLuzHQtmpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas!
On Mon, Sep 23, 2019 at 3:56 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> > diff --git
> a/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
> b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
> > new file mode 100644
> > index 0000000000..e0ca5575dc
> > --- /dev/null
> > +++
> b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
> > @@ -0,0 +1,24 @@
> > +From 2bc7cf0beb6b8a124c1c7360c4fb5279e8763f07 Mon Sep 17 00:00:00 2001
> > +From: Sebastiano Merlino <electrictwister2000@gmail.com>
> > +Date: Sat, 8 Jun 2019 15:36:06 -0700
> > +Subject: [PATCH] Fix lib expectations in libhttpserver.pc.in
> > +
>
> We need a Signed-off-by line (at least from you) in this patch. Also,
> if it comes from upstream, a link to the upstream commit is good to
> have.
>
>
Is there any mechanism allowing to cherry pick a commit from the upstream
repo instead of providing a patch file? I don't really feel good about
modifying the patch file;-)

Kind regards
Stephan

-- 

*Azure IoT* Gold Partner ? *Azure Sphere* Elite Partner ? *Vodafone 
NB-IoT* Partner ? Apple *MFi* & *HomeKit* Developer ? *Bluetooth* SIG ? 
*zigbee* Alliance ? *LoRa* Alliance ? *Thread* Group


grandcentrix GmbH???
Holzmarkt 1???50676 *K?ln*?|?Phoenixseestrasse 18???44263 *Dortmund*???
Deutschland
| t <https://twitter.com/grandcentrix> | f 
<https://www.facebook.com/GrandCentrix/> | in 
<https://www.linkedin.com/company/grandcentrix> | phone: +49-221-677-860-0 
|?email: hello at grandcentrix.net <mailto:hello@grandcentrix.net>



Amtsgericht K?ln | HRB ?70119 | Gesch?ftsf?hrer: R. Rottmann, M. Willnow | 
USt.-IdNr.: DE266333969

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190924/4ffd4a4d/attachment.html>
