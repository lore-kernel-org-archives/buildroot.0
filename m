From: N Cheung <brjerome.1@gmail.com>
Date: Wed, 30 Jul 2008 12:37:24 -0700 (PDT)
Subject: [Buildroot] Atmel 9260 EABI build
In-Reply-To: <4890B677.1060503@gmail.com>
References: <4890B677.1060503@gmail.com>
Message-ID: <18741038.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Sorry about starting a new thread.  I meant to "reply" to John 
Sloan's earlier thread on similar issue but different cpu

http://www.busybox.net/lists/buildroot/2008-July/009952.html


N Cheung wrote:
> 
> 
> I am having similar issues:
> - OABI works but not EABI(kernel works but not root fs),
> - fails at init/login respawning
> - Also EABI kernel can mount an NFS root(glibc not build by buildroot)
> The behavior looked similar to this post (June 2007) 
> http://www.busybox.net/lists/buildroot/2007-June/003206.html
> 
> I also noticed that the sub-arch is not set.  I wonder what is the 
> correct setting for an EABI build? with or without 926t?
> 
> Thanks,
> Norman
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/Atmel-9260-EABI-build-tp18740138p18741038.html
Sent from the BuildRoot mailing list archive at Nabble.com.
