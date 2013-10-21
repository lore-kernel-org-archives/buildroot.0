From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Oct 2013 22:58:49 +0100
Subject: [Buildroot] Buildroot Package Mirror Script
In-Reply-To: <OF57CE4CB6.E374A8CA-ON86257C0B.0069B646-86257C0B.0069B7CF@rockwellcollins.com>
References: <OF57CE4CB6.E374A8CA-ON86257C0B.0069B646-86257C0B.0069B7CF@rockwellcollins.com>
Message-ID: <20131021215849.GA3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2013-10-21 14:15 -0500, Ryan Barnett spake thusly:
> Thomas P and/or Peter,
> 
> I was wondering if it would be possible to get a hold of the scripts that
> are used to populate sources.buildroot.net mirror. Our build server
> resides behind a very restrictive firewall and we would like to automate
> (nightly) the pulling of new packages from the most recent version
> of buildroot source. We've attempted to implement our own script to do 
> this
> with 'make allyespackageconfig' followed by 'make source', however, we
> are running into a few gotchas so we were hoping that we could 
> potentially piggy back off the work that has been done for the
> sources.buildroot.net.

I'm afraid what you did is what is used to populate sources.b.o.
There are no specific 'script' or procedure to do that.

What are the gotchas you're bumped into?

IIRC, there are a few isues yet with some host-packages that are nmot
downloaded with 'make sources'. Is that your issue?. I think Thomas P.
has a set od chages to fix this issue. Thomas?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
