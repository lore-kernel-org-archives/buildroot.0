From: prabindh <prabu@ti.com>
Date: Mon, 18 Feb 2013 20:18:49 -0800 (PST)
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <20130114120416.42b34d77@skate>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
 <20130114120416.42b34d77@skate>
Message-ID: <1361247529229-40702.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On below - how can I help ? Note that sgxconfiguro, while useful in
autoconfigure for egl/gles2, for Qt5 is not especially useful as it fails
because of missing icu detection via autoconfig. So I reverted back to
regular configurations via qmake.conf at this time.



Thomas Petazzoni-2 wrote
> Dear Daniel Nystr?m,
> 
> On Mon, 14 Jan 2013 11:50:48 +0100, Daniel Nystr?m wrote:
>> Very appreciated! Do you know if there is OpenGL support for i.e. OMAP
>> (PowerVR) in Buildroot and, if that's the case, will Qt5 make use of
>> that?
>> 
>> I once started with a PowerVR package for BR, but got interrupted and
>> never
>> had time to catch up. :/
> 
> For now, I have added support for the eglfs backend of Qt5, by using
> the OpenGLESv2 and EGL implementations for the RasberryPi. I've also
> added in the process virtual packages for libglesv2, libegl and
> libopenvg, so that multiple implementations can be packaged for those
> APIs.
> 
> However, I haven't looked at packaging the OMAP PowerVR stuff for now.
> So if anyone wants to have a look, would be nice.
> 
> I currently have https://github.com/prabindh/sgxconfiguro (a set of
> pkg-config files that apparently make it a bit easier to use the SGX
> stuff), and http://gpupowered.org/node/8 opened in my browser, as
> useful links regarding SGX stuff. Just in case someone wants to start
> working on this.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list

> buildroot@

> http://lists.busybox.net/mailman/listinfo/buildroot





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Currently-packaging-Qt5-tp38584p40702.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
