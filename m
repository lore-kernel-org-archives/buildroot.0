From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 18:59:41 +0200
Subject: [Buildroot] Messa3d fails.
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB670397D6CD@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB670397D6CD@WETMEX10.loepfe.com>
Message-ID: <20121012185941.30cd5a2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 12 Oct 2012 15:50:17 +0200, Vellemans, Noel wrote:

> checking for make... make
> checking for python2... no
> checking for python... python
> checking for makedepend... no
> checking for sed... /bin/sed
> configure: error: makedepend is required to build Mesa

I have just sent a patch to the list fixing this particular problem.
However, the build still fails here because it assumes python should
have the libxml2 package installed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
