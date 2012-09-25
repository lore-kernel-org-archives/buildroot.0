From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Sep 2012 14:46:17 +0200
Subject: [Buildroot] Error when building defconfig
In-Reply-To: <CAGduivwG505TRkZ8SnD_MXcyuF6qWwLPoc3CTnZtE5HZ2Uwv0w@mail.gmail.com>
References: <CAGduivwG505TRkZ8SnD_MXcyuF6qWwLPoc3CTnZtE5HZ2Uwv0w@mail.gmail.com>
Message-ID: <20120925144617.6daa086f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 25 Sep 2012 14:38:57 +0200, Maxime Hadjinlian wrote:

> I'm using the HEAD of the git tree of buildroot, and I just tried to
> build a "default" config. I did : $
> cp ./configs/qemu_x86_defconfig .config && make

Wrong way. do:

	make qemu_x86_defconfig
	make

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
