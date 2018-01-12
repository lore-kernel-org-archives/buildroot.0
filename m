From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 21:21:57 +0100
Subject: [Buildroot] [PATCH] package/bash: add /bin/bash to /etc/shells
In-Reply-To: <20180112173510.GA3226@scaer>
References: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
 <20180111171357.GA3559@scaer>
 <20180112095938.621ff1bc@windsurf.lan>
 <20180112173510.GA3226@scaer>
Message-ID: <20180112212157.2541d33f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 18:35:10 +0100, Yann E. MORIN wrote:

> On 2018-01-12 09:59 +0100, Thomas Petazzoni spake thusly:
> > On Thu, 11 Jan 2018 18:13:57 +0100, Yann E. MORIN wrote:  
> > >     grep -E '^/bin/bash$' $(TARGET_DIR)/etc/shells >/dev/null 2>&1 \  
> > grep -q ?  
> 
> -q is not POSIX. Redirecting is guaranteed to always work.

Knowing that Buildroot only supports Linux hosts, do we care about -q
not being POSIX ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
