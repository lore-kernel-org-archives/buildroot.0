From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 24 Feb 2014 12:18:44 +0100
Subject: [Buildroot] udev 182: scsi/scsi.h not found
In-Reply-To: <1671860.tqfC9E0M9p@sagittea>
References: <5307AB0F.30602@gmail.com> <1671860.tqfC9E0M9p@sagittea>
Message-ID: <530B2A94.3040404@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 24/02/2014 11:42, J?r?me Pouiller ha scritto:
> I already noticed this problem. It happends when linux-headers is 
> rebuilt after libc (during its installation, linux-headers remove 
> include/scsi/). You can simply rebuild your toolchain or just do a 
> "make clean". 

In fact I've just finished a full rebuild and now there are no errors!
Thanks
Marco
