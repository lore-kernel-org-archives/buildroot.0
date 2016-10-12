From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 14:37:07 +0200
Subject: [Buildroot] [PATCH] package/shairport-sync: bump to version
 2.8.5
In-Reply-To: <1476273756.1492.2.camel@embedded.rocks>
References: <20161011200732.29826-1-joerg.krause@embedded.rocks>
 <20161012135745.353243f9@free-electrons.com>
 <1476273756.1492.2.camel@embedded.rocks>
Message-ID: <20161012143707.21b6b69d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Oct 2016 14:02:36 +0200, J?rg Krause wrote:

> > Do you really see things installed in /usr/local/etc ? Why isn't the
> > global --sysconfdir passed by pkg-autotools.mk not working ?  
> 
> To be honest, I only checked that passing sysconfdir locally is working
> as I didn't know that it is passed globally. So I will remove this
> setting in v2.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
