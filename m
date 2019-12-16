From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 10:45:14 +0100
Subject: [Buildroot] [PATCH v2] boot/at91bootstrap3: bump to version
 3.9.0
In-Reply-To: <20191024112430.at6l2alidwxxx4do@M43218.corp.atmel.com>
References: <1571765902-878-1-git-send-email-pjtexier@koncepto.io>
 <1571765902-878-2-git-send-email-pjtexier@koncepto.io>
 <20191024112430.at6l2alidwxxx4do@M43218.corp.atmel.com>
Message-ID: <20191216104514.7a9fe980@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre-Jean,

On Thu, 24 Oct 2019 11:23:34 +0000
<Ludovic.Desroches@microchip.com> wrote:

> > diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
> > index ecfda3b..93f495f 100644
> > --- a/boot/at91bootstrap3/at91bootstrap3.hash
> > +++ b/boot/at91bootstrap3/at91bootstrap3.hash
> > @@ -1,2 +1,2 @@
> >  # Locally calculated
> > -sha256	a5a10579598d47475696fab56c086225b0f4b710299e2dc9e0f9b6f72ed98be8  at91bootstrap3-v3.8.13.tar.gz
> > +sha256	9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e  at91bootstrap3-v3.9.0.tar.gz  
> 
> I don't have the same:
> e23e6df23b79ca81e412cb73a1f48bd95df8d46c7d52a1d073c2ed9d4f3a1a71
> /home/ldesroches/Downloads/at91bootstrap-3.9.0.tar.gz
> 
> I downloaded it 2 times, can you check again?

Indeed, I also don't see the correct hash:

ERROR: at91bootstrap3-v3.9.0.tar.gz has wrong sha256 hash:
ERROR: expected: 9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e
ERROR: got     : e23e6df23b79ca81e412cb73a1f48bd95df8d46c7d52a1d073c2ed9d4f3a1a71
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

I'm seeing the same hash as Ludovic here.

Pierre-Jean, could you double check ? Do you still have in your
download folder the tarball with the
9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e hash ?
If so, please don't delete it, and instead use it to compare it with
the current tarball that you can get by downloading from Github.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
