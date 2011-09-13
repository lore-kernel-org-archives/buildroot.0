From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Tue, 13 Sep 2011 16:31:54 +0200
Subject: [Buildroot] Minimal X-system for ARM ?
References: <1531E53627F1F749B4FE809BF2A4EB6702A7F077@WETMEX10.loepfe.com>
 <20110913154459.7940ea4b@skate> 
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702A7F117@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

OK, you re right not enough info to be accurate. (sorry)

At this time I'm trying to build an arm-system with an LCD and capacitive-touch-screen-interface ( I do not have a REAL-keyboard).

In the ideal case I would like to build a device that compares to some sort of tablet.
That runs some extra software to handle direct-input/outputs and serial communications to external-devices.

The LCD-would then be used to visualize some stuff.
In the most ideal case I would like to do this with the WEB-BROWSER, that is running on the ARM-device himself, making it possible to build a fancy user interface without the need of real-coding and giving me the option (for free) to look/see at it remotely (with a PC and browser).

Also would the WEB-Brouwser-UI allow me to change the look and feel of the device without the need of 'real' coding.


At this time I have the this setup running on DirectFB (meaning without xserver/client), but I'm having troubles to get a 'VIRTUAL-keyboard' running under directFb.

I was looking at some other systems that you can compare and the all seem to have an X-server (and window manager) running.


So I though things would be more easy/better if I had a X-server (and client and associated libs) running, as far as I can see this gives me the option of the Virtual-keyboard.

I must Say I'm new to building X (server/clients and window-managers... This was the reason for the question)


Kinds regards,
Noel.

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: 13Sep11 15:45
To: buildroot at busybox.net
Subject: Re: [Buildroot] Minimal X-system for ARM ?

Le Tue, 13 Sep 2011 15:12:11 +0200,
"Vellemans, Noel" <Noel.Vellemans@visionBMS.com> a ?crit :

> I wonder if someone can tell me where to find a 'requirements' list 
> that tells me what I have to build (select)  in order to get a minimal 
> X-SYSTEM running (for an ARM powered device)?
> 
> [ there are so many possible options (in buildroot) that it is nearly 
> impossible to try them all ]
> 
> In other words is there someone out there that can provide me a 
> working buildroot configuration that allows me to build a 
> minimal-X-system.
> 
> Or a link to a webpage describing what the requirements are for a 
> minimal X-system, would also be welcome.

Could you define what "X-system" is ? Are you referring to the X.org graphics server and its associated libraries ?

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
