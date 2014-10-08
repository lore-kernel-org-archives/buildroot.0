From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 22:18:07 +0200
Subject: [Buildroot] [PATCH 1/3] package/squid: enable ICAP server
 support in squid and define logdir, pidfile and swapdir
In-Reply-To: <5435988F.70209@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1411032426-11463-2-git-send-email-guillaume.gardet@oliseo.fr>
 <20141005235232.66d3c09c@free-electrons.com>
 <5435988F.70209@oliseo.fr>
Message-ID: <20141008221807.3b9e147d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Oct 2014 22:03:27 +0200, Guillaume GARDET - Olis?o wrote:

> > I believe the changes of adding the log directory, pidfile and swapdir
> > on one side, and adding the ICAP client option on the other side should
> > be two separate patches.
> 
> Ok, will submit two patches then.

Great thanks.

> > Also, how much does the ICAP client support adds to Squid size? I'm
> > trying to see if this should be optional instead of always enabled like
> > you're proposing.
> 
> Without: 2.7 MB,and with c-icap: 3.0 MB
> 
> Should I make it optionnal?

I would tend to say yes. Making it optional not only saves space, but
it also makes it explicit that our Squid build can support the ICAP
client functionality.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
