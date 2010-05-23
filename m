From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 May 2010 10:55:23 +0200
Subject: [Buildroot] Merge request
In-Reply-To: <8739xjr8li.fsf@macbook.be.48ers.dk>
References: <20100521102918.0e8b70eb@surf> <8739xjr8li.fsf@macbook.be.48ers.dk>
Message-ID: <20100523105523.225c205b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 May 2010 22:21:13 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I'm not completely happy about adding that one this late in the
> release cycle, but I've committed the other 3 - Thanks!

Why ? This patch isn't modifying any existing code, it just adds new
code. If this code is broken, well, then BeagleBoard support will not
work, but otherwise it wouldn't be supported.

IMO, Yann's changes on package/config clean target were more dangerous
than this one.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
