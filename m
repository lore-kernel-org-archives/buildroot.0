From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 13:41:38 +0200
Subject: [Buildroot] [PATCH/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <670f6e5c-e513-6b3f-ed82-4da1ddc3d141@lucaceresoli.net>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <670f6e5c-e513-6b3f-ed82-4da1ddc3d141@lucaceresoli.net>
Message-ID: <20160823134138.6f9818ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 12:09:54 +0200, Luca Ceresoli wrote:

> > +N:	Luca Ceresoli <luca@lucaceresoli.net>
> > +F:	package/agentpp/
> > +F:	package/exim/
> > +F:	package/ffmpeg/
> > +F:	package/linphone/  
> 
> I haven't had any role on the ffmpeg and linphone packages since >4
> years now. I think this line should be removed from under my name.

ACK. For ffmpeg, it's fine, since Bernd is also listed (and he is doing
most of the effort on ffmpeg these days.

However, for linphone, it's a bit annoying because it means no-one is
looking after this package. Should we deprecate it?

In any case, I've dropped those two packages from your name.

> > +F:	package/qpid-proton/
> > +F:	package/rtl8188eu/
> > +F:	package/stm32flash/
> > +F:	package/unzip/  
> 
> Ok for these.
> 
> Also, as Bernd suggested, libpjsip should be added.

Yes, this is done already.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
