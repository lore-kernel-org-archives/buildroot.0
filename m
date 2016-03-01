From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 17:48:00 +0100
Subject: [Buildroot] [PATCH] imx-gpu-viv: fix build dependencies when
	linking against libGAL.so
In-Reply-To: <1456835986-16764-1-git-send-email-antoine.tenart@free-electrons.com>
 (Antoine Tenart's message of "Tue, 1 Mar 2016 13:39:46 +0100")
References: <1456835986-16764-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <87y4a2jgan.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Tenart <antoine.tenart@free-electrons.com> writes:

 > Packages like QT5 Base with OpenGL and X support link against libGAL.so
 > at build time. This results in an error because some X functions used
 > in libGAL.so aren't referenced as the libXdamage, libXext and libXfixes
 > packages aren't built and installed into sysroot at the time. Fix this
 > by adding these three packages as build dependencies of imx-gpu-viv.

 > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
