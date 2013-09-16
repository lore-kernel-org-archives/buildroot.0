From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 17:38:12 +0200
Subject: [Buildroot] [PATCHv2 04/14] gcc: fix Fortran support
In-Reply-To: <87eh8pkd53.fsf@dell.be.48ers.dk>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87eh8pkd53.fsf@dell.be.48ers.dk>
Message-ID: <20130916173812.5c424599@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 15 Sep 2013 23:07:04 +0200, Peter Korsgaard wrote:

> I wonder if we shouldn't deprecate fortran (and objc) support and get
> rid of them. Is there really a use case for them? Any interesting sw
> that needs them?

I have no idea. I believe Objective-C is completely useless. However, I
believe Fortran *might* be useful for some scientific applications that
could be used on embedded devices. But the fact that no-one ever
complained about our Fortran support being broken (the runtime library
was never copied to the target) is a fairly strong indication that
nobody is using this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
