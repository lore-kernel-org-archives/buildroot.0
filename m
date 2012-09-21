From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 20:52:24 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
 host-pkg-config
In-Reply-To: <87ehlv79fj.fsf@macbook.be.48ers.dk>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <87ehlv79fj.fsf@macbook.be.48ers.dk>
Message-ID: <20120921205224.55eeda57@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 21 Sep 2012 16:11:12 +0200, Peter Korsgaard wrote:

> Lots of stuff indeed pulls in host-pkgconfig, and as 'u' is pretty late
> in the alphabet the chance is quite high that it is already available:

Can we somehow fight this alphabet thing and make things even more
random? Something that would shuffle the make targets or something, but
I don't know if it is possible.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
