From: Sabri Altunbas <sabri.altunbas@gmx.de>
Date: Sat, 25 May 2013 16:18:36 +0200
Subject: [Buildroot] buildroot needs a root pasword, why ??
In-Reply-To: <20130525151830.68bca681@skate>
References: <2F3FBE81FE784B19BA37A3BE62C1FA7A@M58p><20130524174319.GA3205@free.fr><B2E777BEED5E4FB9A7E403CE15ED3A4A@M58p><20130524213049.GB3205@free.fr>
 <20130525151830.68bca681@skate>
Message-ID: <2C98102DFACA44FEA5801B0188B74651@M58p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

> Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Gesendet: Samstag, 25. Mai 2013 15:19


Thomas, fein to meet you.

> 
> > On 2013-05-24 22:57 +0200, Sabri Altunbas spake thusly:
> > > If I press ENTER I get this error message
> > >
> > > Welcome to Buildroot
> > > buildroot login: root
> > > Password:
> > > Login incorrect
> > > buildroot login:
> 
> On what serial port device are you running the login prompt? Is this
> serial port listed in /etc/securetty?

Inittab
..
..
# Put a getty on the serial port
ttyAMA0::respawn:/sbin/getty -L ttyAMA0 115200 vt100 # GENERIC_SERIAL
..
..

securetty
..
..
ttyS0
ttyS1
ttyS2
ttyS3
ttyAMA0
ttyAMA1
ttyAMA2
ttyAMA3
..
..

I selected sourcery toolchain. In attachement is my .config

Regards, S.Altunbas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 24824 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130525/5e4c503b/attachment-0001.obj>
