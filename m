From: lpdev at cordier.org <lpdev@cordier.org>
Date: Wed,  6 Feb 2019 10:33:48 +0100 (CET)
Subject: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
In-Reply-To: <20190206094727.24dfa441@windsurf>
Message-ID: <ea-mime-5c5aa9fc-6f58-26e2ec99@www-1.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ? : Louis-Paul Cordier <lpdev@cordier.org>
> Sujet : Re: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
> Date : 06/02/2019 09:47:27 Europe/Paris
> Copie ? : buildroot at buildroot.org;
>    Bernd Kuhls <bernd.kuhls@t-online.de>;
>    MahyarKoshkouei <mahyar.koshkouei@gmail.com>;
>    Martin Storsj?? <martin@martin.st>
>
> On Tue, 5 Feb 2019 19:19:45 +0100
> Louis-Paul Cordier <lpdev@cordier.org> wrote:
>
> > FFserver is not supported anymore
> > Remove patch 0001: fixed upstream in cae6f806a6367c7760ab6ed059d343d4a8eebd56
> > Remove patch 0002 to 0004: accepted upstream
> >
> > Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
>
> As was previously discussed, we cannot merge this if all packages that
> depend on ffmpeg are not compatible with ffmpeg 4.x.
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi again,

What decision should be taken on this? We have 2 solutions has Bernd stated: either bumping GStreamer to a more recent version (that seems to be not welcomed by some people), or applying Bernd patch. What about the latter? 

I can modify my patch serie to include Bernd's patch. Would it possibly convince everyone for a final merge?

In the meantime, I think you can merge intel media driver and mediasdk patches. Thanks for your time!

BR,
Louis-Paul CORDIER
