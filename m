From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 23 Feb 2011 15:27:30 -0800
Subject: [Buildroot] OT: ideas for embedded computers?
In-Reply-To: <AANLkTi=oM=aixkU_SjF6qXRr70rW0voNS3xRd3yekHAj@mail.gmail.com>
References: <AANLkTi=oM=aixkU_SjF6qXRr70rW0voNS3xRd3yekHAj@mail.gmail.com>
Message-ID: <AANLkTikSYVq4ksWkt5aNoQiEiROrSKGAV-jygOZjbwr1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A shoebox full of BeagleBoards perhaps?

On Wed, Feb 23, 2011 at 3:03 PM, Kyle Hayes <kyle@greenmonitor.com> wrote:

> Sorry for the off topic post, but this list seems to have a lot of people
> who might be able to help me.
>
> We are currently using DMP/ICop's eBox 3300 series of computers.  These are
> tiny, fan-less, x86-based systems.  Overall, they are pretty good.  Very low
> power (5W) and a nice big metal heat sink as the top part of the case.
> Cheap too, US$150 or so.
>
> However, I'm increasingly convinced that there are hardware issues.  The
> SoC this is based off of seems to have problems with the EHCI controller and
> I have completely unexplained reboots on systems that are on UPS power.  I
> have found reference to other hardware problems on various web sites.  While
> the drivers are all in the latest Linux kernels, it is clear that the
> platform is not supported.  A few weeks ago I posted to the list when I was
> trying to get a Buildroot image made for these machines and was having
> trouble with OpenSSH.  Debugging did not work and a poster on this list said
> that he was unable to use GDB with later kernels.  I was never able to get
> OpenSSH running, but Dropbear worked.
>
> I have investigated the SheevaPlug and the GuruPlug parts from Global Scale
> Tech.  Unfortunately, it appears that Global Scale does not have good
> engineers and is too willing to cut costs.   I have found many reports of
> thermal problems with the GuruPlug and reports that the later version of the
> SheevaPlug suffer from substandard component quality (power supplies burning
> out in less than a year).  The price is nice though: US $99.
>
> Our application is "mild industrial".  Our systems are installed in
> existing telephone closets etc. where there is little ventilation but
> temperatures in the buildings are kept for human comfort.  Generally the
> environment is not above 25C.
>
> We need one Ethernet port (10/100 is all we need) and one USB1 standard
> plug.  We need enough CPU to run things like OpenVPN and 8-16MB of RAM after
> the OS loads.  We currently use Linux.  Under normal load our current
> systems are using around 1% of the CPU time (1GHz i486-class processor).
>
> Does anyone have alternatives that are less than US$250?
>
> We now return you to your normally scheduled program.
>
> Best,
> Kyle
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110223/aca527c9/attachment.html>
