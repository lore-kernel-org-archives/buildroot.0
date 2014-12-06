From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Dec 2014 12:10:48 +0100
Subject: [Buildroot] [PATCH 1/3] fconfig: change upstream site
In-Reply-To: <20141206105555.GA3938@free.fr>
References: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141206105555.GA3938@free.fr>
Message-ID: <20141206121048.6fd9cd3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 6 Dec 2014 11:55:55 +0100, Yann E. MORIN wrote:

> I've had a look at what others do, and OpenWRT still has no better URL.

Yes, I also googled a bit to search for a different upstream location,
also looked at OpenWRT, and concluded that there was no other solution
that using sources.buildroot.net.

The other solution I had in mind was to simply deprecate the package.
fconfig is used only to get/set the RedBoot environment, and RedBoot is
probably almost inexistent nowadays.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
