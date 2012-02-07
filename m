From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Tue, 7 Feb 2012 15:26:58 +0100
Subject: [Buildroot] [PATCHv2 1/2] Add lpc3250loader to the host tools
In-Reply-To: <CAAXf6LV1icxeia44weRDfuoSwkSbmkZRmdNG+wskWOmgGhOGMw@mail.gmail.com>
References: <1328612486-7770-1-git-send-email-alexandre.belloni@piout.net>
 <CAAXf6LV1icxeia44weRDfuoSwkSbmkZRmdNG+wskWOmgGhOGMw@mail.gmail.com>
Message-ID: <20120207142657.GA9121@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 07, 2012 at 03:24:11PM +0100, Thomas De Schampheleire wrote :
> On Tue, Feb 7, 2012 at 12:01 PM, Alexandre Belloni
> <alexandre.belloni@piout.net> wrote:
> > diff --git a/package/lpc3250loader/Config.in.host b/package/lpc3250loader/Config.in.host
> > new file mode 100644
> > index 0000000..750080b
> > --- /dev/null
> > +++ b/package/lpc3250loader/Config.in.host
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_HOST_LPC3250LOADER
> > + ? ? ? bool "host lpc3250loader"
> > + ? ? ? help
> > + ? ? ? ? lpc3250loader is a tool to load/burn programs (in particular kickstart
> > + ? ? ? ? and S1L) on an LPC3250 platform.
> 
> Does it make sense to have this config depend on an architecture
> specific variable?
> Although it would still be very broad, depending on BR2_ARCH_arm could
> be a possibility...
> 
> This way, users of other architectures are not presented with packages
> that are irrelevant for them...
> 

Could be, it wasn't the case for sam-ba though...

-- 
Alexandre Belloni
