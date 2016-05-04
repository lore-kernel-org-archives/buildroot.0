From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 May 2016 00:40:39 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <572A61D4.10905@gmail.com>
References: <572A61D4.10905@gmail.com>
Message-ID: <7132491b-5080-2001-1717-250d698244e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/16 22:55, Marco Trapanese wrote:
> Hi! I've searched through the available packages - I'm looking for something
> like bluetoothctl in debian.
> I have a working bluez+pulseaudio/alsa system, but I need a way to request a pin
> for incoming connection requests, to trust some addresses and to enable BT and
> BLE profiles as desired.

  Isn't it part of bluez5_utils?

  Regards,
  Arnout

>
> Is there anything about?
> Otherwise I will try to add a package by myself.
>
> Best regards
> Marco
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
