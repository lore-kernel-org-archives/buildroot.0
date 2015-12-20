From: Eelco Chaudron <echaudron@xiot.nl>
Date: Sun, 20 Dec 2015 19:25:16 +0100
Subject: [Buildroot] buildroot support for OrangePI PC
In-Reply-To: <56748758.7040908@mind.be>
References: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
 <56748758.7040908@mind.be>
Message-ID: <5676F28C.1010005@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cam,

If you can share the repo's (uboot/linux) you are thinking to use I can 
make a head start with the PC version and share whatever I have by 
January first.

//Eelco

Cam Hutchison<camh@xdna.net>  writes:

> Hi All,
> Was wondering if anyone has started working on OrangePi PC board support?
I'll be embarking on this in the new year (OrangePi Plus too). I plan is
to come up with two defconfigs - one for the 3.4 kernel which supports
the hardware ok but has a lot of code that is not mainlined and has a
custom build process, and one for mainline which currently has limited
support for the H3 and Orange Pi (although there is current activity so
I'll also track the linux-sunxi kernel too).

I'll keep my WIP on a github repo and I can let you know when I make a
start.
