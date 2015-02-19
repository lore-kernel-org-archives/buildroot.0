From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 23:05:22 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build with gettext
In-Reply-To: <20150219220400.GP2937@tarshish>
References: <be7f33ed40d541fb09ae8582b83f3b5c39d5dd27.1424175644.git.baruch@tkos.co.il>
 <20150219225818.63fccb6f@free-electrons.com>
 <20150219220400.GP2937@tarshish>
Message-ID: <20150219230522.63d84fea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 20 Feb 2015 00:04:00 +0200, Baruch Siach wrote:

> > This is really ugly, because we have to duplicate the lib_LIBS value
> > from the package Makefile, and whenever it gets changed in the package
> > Makefile, we need to remember to also change it here. Not great :-/
> 
> This is temporary. Upstream switched to autotools for the next version (now at 
> v3.19-rc2). Once we upgrade the usual LIBS= trick would be enough, I believe.

Ah, ok, good to know! Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
