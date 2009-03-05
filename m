From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2009 15:47:50 +0100
Subject: [Buildroot] Duplication and size of binaries in generated
 toolchain
In-Reply-To: <878wnkf3r7.fsf@macbook.be.48ers.dk>
References: <20090305151359.20b37039@surf> <878wnkf3r7.fsf@macbook.be.48ers.dk>
Message-ID: <20090305154750.0ff0c0aa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 05 Mar 2009 15:22:52 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> I'm not sure why the binaries without the arm-linux prefix
>  Thomas> are needed in usr/arm-linux/bin. But if they are, couldn't
>  Thomas> they be symbolic links.
> 
> They are hard links to the same file:

Ok, I missed that. But why are they needed in the first place ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
