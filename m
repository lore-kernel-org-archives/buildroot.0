From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 22:26:06 +0100
Subject: [Buildroot] [V2 1/2] scancpan: handle recommended dependencies
 as optional packages
In-Reply-To: <CAB0FRsvpFBhyRs5Y3ZuX2DV-Y79coZGnrupRo51izsMZ4H3wiA@mail.gmail.com>
References: <1453409093-22012-1-git-send-email-francois.perrad@gadz.org>
 <20160305164158.5e7eca18@free-electrons.com>
 <CAB0FRsvpFBhyRs5Y3ZuX2DV-Y79coZGnrupRo51izsMZ4H3wiA@mail.gmail.com>
Message-ID: <20160312222606.30acf115@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Mar 2016 18:58:16 +0100, Fran?ois Perrad wrote:

> > ./output/host/usr/bin/perl ./support/scripts/scancpan -recommend IO-Stream
> >
> 
> Works for me. Try with the flag -f in order to override existing files.

Ok, I'll retry. Can you send an updated version that takes into account
my other comments?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
