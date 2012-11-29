From: David Collier <from_buildroot@dexdyne.com>
Date: Thu, 29 Nov 2012 14:58 +0000 (GMT Standard Time)
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <CAEYzJUFwwAQnBu3opGyLKkpmc98FJL-rfvndtuPns4rATx8A7w@mail.gmail.com>
Message-ID: <memo.20121129145816.4232J@postmaster+dexdyne.com.cix.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In article
<CAEYzJUFwwAQnBu3opGyLKkpmc98FJL-rfvndtuPns4rATx8A7w@mail.gmail.com>,
bjorn.forsman at gmail.com (Bj?rn Forsman) wrote:

> I'm not sure what Atmel put in their Buildroot fork, but we've been 
> using
> mainline buildroot 2010.08 for one of our AVR32 projects.

I'm not sure what Atmel put in their Buildroot fork, but we've been using
mainline buildroot 2010.08 for one of our AVR32 projects.

yes indeed. That's what's in their buildroot.

I was provoked into this by the fact that on another board I have openVPN
2.1_rc11 , whereas the one on my AVR32 board is 2.0.9

One insists on a particular line in the config file before running user
scripts, and the other won't tolerate it.

So I was hoping to upgrade to a more recent openVPN - and hoping it would
come in a more recent buildroot.

So one interesting question is - does std buildroot include OpenVPN, and
if so what revision :-)

D
