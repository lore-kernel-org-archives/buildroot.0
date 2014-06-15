From: Noam Camus <noamc@ezchip.com>
Date: Sun, 15 Jun 2014 11:46:03 +0000
Subject: [Buildroot] FW: [PATCH 1/1] toolchain-buildroot: create
	a	relocatable one
In-Reply-To: <20140608154420.GF4074@tarshish>
References: <884EA965490E3C4D8E66AEF41E9802502525C8@ezex10.ezchip.com>
 <20140608145430.0125bb29@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E980250252659@ezex10.ezchip.com>
 <20140608154632.1f6f13a6@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E9802502528F6@ezex10.ezchip.com>
 <20140608154420.GF4074@tarshish>
Message-ID: <884EA965490E3C4D8E66AEF41E980250256965@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> See the EXAMPLE section of the git-send-email(1) man page (online at
> http://git-scm.com/docs/git-send-email).
> 
I followed EXAMPLE section but /usr/libexec/git-core/git-send-email always complains:
Unable to initialize SMTP properly. Check config and use --smtp-debug. VALUES: server=smtp.gmail.com encryption=tls maildomain=xxx.ezchip.com Debug=0 port=587 at /usr/libexec/git-core/git-send-email line 1041.

This is Net::SMTP->new() that always returns NULL.
I used CPAN to install latest Net::SMTP.

Any ideas?

Regards
Noam Camus
