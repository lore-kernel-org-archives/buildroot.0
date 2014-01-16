From: Sven Neumann <neumann@teufel.de>
Date: Thu, 16 Jan 2014 14:57:10 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
 of external ffmpeg
In-Reply-To: <87ppnsoyrz.fsf@dell.be.48ers.dk>
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
 <87lhyht3mx.fsf@dell.be.48ers.dk> <52D6EACE.8020403@zacarias.com.ar>
 <87ha95t32e.fsf@dell.be.48ers.dk> <1389877529.6623.4.camel@sven>
 <87ppnsoyrz.fsf@dell.be.48ers.dk>
Message-ID: <1389880630.6623.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Do, 2014-01-16 at 14:13 +0100, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
> 
> Hi,
> 
> > I do think moving to the internal libav copy for gst-ffmpeg until we can
>  >> completely remove it is OK though. If people really need it, then the
>  >> (outdated) bundled library is still better than no gst-ffmpeg.
> 
>  > Are you interested in a patch that adds gst1-libav (version 1.2.x) ? We
>  > are using this for a while now. Our package uses the internally bundled
>  > library though.
> 
> Sure!

To be honest, our version of the gst1-libav package disables almost
everything and just builds a handful of audio decoder plug-ins. But I'll
remove these hacks and submit a full version. I can not guarantee that
it will build cleanly though.


Regards,
Sven

-- 
Sven Neumann
Senior System Architect

Lautsprecher Teufel GmbH
Gewerbehof B?lowbogen, Aufgang D1
B?lowstr. 66
10783 Berlin
Germany

Direkt   +49 (0) 30 / 300 930-153
Telefon  +49 (0) 30 / 300 930-0

neumann at teufel.de

Registernummer HRB 20271 beim Amtsgericht Berlin-Charlottenburg
Gesch?ftsf?hrer: J?rgen Schneider, Edgar van Velzen
Umsatzsteuer-ID: DE136745959

www.teufel.de - www.teufelaudio.com - www.raumfeld.com
