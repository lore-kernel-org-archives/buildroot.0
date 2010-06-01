From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jun 2010 18:05:34 +0200
Subject: [Buildroot] libxml2 / gzopen64
In-Reply-To: <1275407041.2737.13.camel@HellDesk.zuhause.net>
References: <1275407041.2737.13.camel@HellDesk.zuhause.net>
Message-ID: <20100601180534.38cf26e3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 01 Jun 2010 17:44:01 +0200
Holger <ltsp@webers-web.net> wrote:

> Hello, I use the latest GIT version of buildroot and get the follwing
> error.

Ok, I'm currently testing your configuration. However, I fear that the
problem is due to libxml2 looking at libraries installed on your host
machine.

Could you remove everything (rm -rf output) and redo the build by
saving the full build log :

	make 2>&1 | tee build.log

then, put the build.log file online somewhere and post the link to the
mailing list.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
