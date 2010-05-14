From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 12:13:07 +0200
Subject: [Buildroot] [PATCH 1/5] grep: give hints to ./configure on
 where gettext() is
In-Reply-To: <871vdj3p2l.fsf@macbook.be.48ers.dk>
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
	<cover.1273527584.git.thomas.petazzoni@free-electrons.com>
	<73fa57064639d2877081f70b1e176b1163cd4583.1273527584.git.thomas.petazzoni@free-electrons.com>
	<871vdj3p2l.fsf@macbook.be.48ers.dk>
Message-ID: <20100514121307.1b02ea59@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 May 2010 08:55:14 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> That must mean some other package has loaded the cache with wrong info.
> We should fix that instead.

You're right. I have a new stack of patches fixing this the proper way.
Several other packages were affected by this issue.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
