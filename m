From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 May 2013 15:18:30 +0200
Subject: [Buildroot] buildroot needs a root pasword, why ??
In-Reply-To: <20130524213049.GB3205@free.fr>
References: <2F3FBE81FE784B19BA37A3BE62C1FA7A@M58p>
 <20130524174319.GA3205@free.fr>
 <B2E777BEED5E4FB9A7E403CE15ED3A4A@M58p>
 <20130524213049.GB3205@free.fr>
Message-ID: <20130525151830.68bca681@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 May 2013 23:30:49 +0200, Yann E. MORIN wrote:

> On 2013-05-24 22:57 +0200, Sabri Altunbas spake thusly:
> > If I press ENTER I get this error message
> > 
> > Welcome to Buildroot
> > buildroot login: root
> > Password: 
> > Login incorrect
> > buildroot login:

On what serial port device are you running the login prompt? Is this
serial port listed in /etc/securetty?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
