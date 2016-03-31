From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 04:00:40 +0200
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <56E2A91A.1030509@zacarias.com.ar>
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk>
 <56E2A91A.1030509@zacarias.com.ar>
Message-ID: <20160331040040.0083ba81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 08:16:42 -0300, Gustavo Zacarias wrote:
> On 11/03/16 08:09, Peter Korsgaard wrote:
> 
> > Hi,
> >
> >   > To sum up: Yes, it is possible to build a i915 gallium driver in mesa3d,
> >   > but who needs it? That's the reason I never implemented a Config.in
> >   > option for it, but it will not hurt having one ;)
> >
> > Ok, that was more of less also my understanding. Gustavoz, what do you
> > need the gallium driver for?
> 
> "DRI drivers need X.org" -> wayland, plus libgtk3 with it as backend.

"DRI drivers need X.org" ? This seems wrong, since you precisely sent a
patch recently to all DRI drivers to be built without X.org.

So I guess this specific patch, allowing to build the unmaintained
Intel Gallium driver is no longer needed?

I've marked it as Rejected on patchwork for now. Let me know if you
disagree for some reason.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
