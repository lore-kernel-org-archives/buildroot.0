From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Dec 2012 18:47:14 +0100
Subject: [Buildroot] Can buildroot build kernel documentations?
In-Reply-To: <20121221171052.GA12422@zuhnb712>
References: <20121221171052.GA12422@zuhnb712>
Message-ID: <20121221184714.0cdfded6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Sat, 22 Dec 2012 01:10:52 +0800, Woody Wu wrote:

> In addtional to build the kernel image, if I also want to build the
> kernel documentation (make htmldocs), can I do it in buildroot?

cd output/build/linux-* ; make htmldocs

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
