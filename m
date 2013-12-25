From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 10:18:23 +0100
Subject: [Buildroot] [PATCH] external python modules: remove redundant
 python dependency
In-Reply-To: <CAAXf6LX8HCcpYtC_8wAn49SU3aV+xf=Jr3RfuxH6HUQscnYnfQ@mail.gmail.com>
References: <7ffd4acd582283fb083a.1387905292@argentina>
 <20131225095620.7e4d611c@skate>
 <CAAXf6LX8HCcpYtC_8wAn49SU3aV+xf=Jr3RfuxH6HUQscnYnfQ@mail.gmail.com>
Message-ID: <20131225101823.08410a60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 25 Dec 2013 10:05:20 +0100, Thomas De Schampheleire wrote:

> Ok, understood.
> But in that case, I will submit another patch to make sure that all
> these python modules do indeed use the 'depends on', because for
> example python-bottle does not.

Agreed, python-bottle does not conform to this rule.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
