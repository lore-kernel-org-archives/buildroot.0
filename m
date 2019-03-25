From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 18:54:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/keepalived: add optional
 nftables dependency
In-Reply-To: <87h8bsmq9q.fsf@tarshish>
References: <20190324120016.28701-1-fontaine.fabrice@gmail.com>
 <87h8bsmq9q.fsf@tarshish>
Message-ID: <20190325185421.6141a000@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Mar 2019 14:05:21 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
> > +KEEPALIVED_DEPENDENCIES += iptables
> > +KEEPALIVED_CONF_OPTS += --enable-nftables  
> 
> What do you need that for? Please explain in the commit log and in an
> inline comment.

I'm not sure what needs to be further explained. The fact that nftables
can be provided either by the iptables package or by the nftables
package ? Baruch, could you clarify what additional explanations you
are looking for ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
