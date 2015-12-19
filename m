From: Cam Hutchison <camh@xdna.net>
Date: Sat, 19 Dec 2015 23:51:52 -0000
Subject: [Buildroot] buildroot support for OrangePI PC
References: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
Message-ID: <6b87.5675ed98.926d4@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eelco Chaudron <echaudron@xiot.nl> writes:

>Hi All,

>Was wondering if anyone has started working on OrangePi PC board support?

I'll be embarking on this in the new year (OrangePi Plus too). I plan is
to come up with two defconfigs - one for the 3.4 kernel which supports
the hardware ok but has a lot of code that is not mainlined and has a
custom build process, and one for mainline which currently has limited
support for the H3 and Orange Pi (although there is current activity so
I'll also track the linux-sunxi kernel too).

I'll keep my WIP on a github repo and I can let you know when I make a
start.
