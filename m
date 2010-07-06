From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jul 2010 17:20:41 +0200
Subject: [Buildroot] [git commit master 1/1] libsvgtiny: pass
 TARGET_CONFIGURE_ENV / OPTS to each make invocation
In-Reply-To: <20100706144330.4DBF08257C@busybox.osuosl.org>
References: <20100706144330.4DBF08257C@busybox.osuosl.org>
Message-ID: <20100706172041.7df6c560@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 6 Jul 2010 16:43:04 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

>  define BZIP2_CLEAN_CMDS

Should probably be LIBSVGTINY_CLEAN_CMDS.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
