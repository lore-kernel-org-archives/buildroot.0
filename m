From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Mar 2010 19:57:39 +0200
Subject: [Buildroot] Buildroot with uClibc 0.9.29
In-Reply-To: <6fff79821003291020h7e96dc68ufa227f5df3a96cb0@mail.gmail.com>
References: <6fff79820910130628peb87f9bo9c41414b461c0d@mail.gmail.com>
	<6fff79821003290958r5f66ddc1hd35a193848c61b74@mail.gmail.com>
	<6fff79821003291020h7e96dc68ufa227f5df3a96cb0@mail.gmail.com>
Message-ID: <20100329195739.5e9e621a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2010 22:50:42 +0530
Souvik Ghosh <mailtosouvik@gmail.com> wrote:

> I tried with gcc 4.3.2 and uclibc 0.9.30 as well. But same result has been
> produces. Can anybody please help me out.

Please do not use Buildroot 2009.02 anymore, but 2010.02 instead.

The problem is probably that you must remove all the output directories
and rebuild everything from scratch. This is cumbersome with Buildroot
2009.02, but very easy with Buildroot 2010.02. Could you please
upgrade ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
