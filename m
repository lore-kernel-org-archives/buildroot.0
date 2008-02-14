From: Fathi Boudra <fboudra@gmail.com>
Date: Thu, 14 Feb 2008 15:55:22 +0100
Subject: [Buildroot] binutils ftbfs on x86_amd64 host
In-Reply-To: <20080214124011.GA9252@cloud.net.au>
References: <6a2e33620802131426g4ef22451k8f0a9e80e7ad0ba8@mail.gmail.com>
	<20080213234203.GC30407@cloud.net.au>
	<6a2e33620802140014x1acfccf6n2eb27d93669f061@mail.gmail.com>
	<20080214124011.GA9252@cloud.net.au>
Message-ID: <6a2e33620802140655u4988c66du32168b2c956c0dbb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I guess it's not a host-specific problem then ;)
>

unfortunately, I tried on 3 different machines (Sid amd64):
- on 2 machines, I have binutils ftbfs
- on 3rd machine, another ftbfs:
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080214/fb4b03de/attachment.htm 
