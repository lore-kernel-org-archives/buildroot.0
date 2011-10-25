From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 12:30:08 +0200
Subject: [Buildroot] [PATCH 4/6] qemu_x86: update to kernel 3.1 and add
	readme
In-Reply-To: <a0295126a06f4884db6a02d03c460db8@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 25 Oct 2011 06:52:53 -0300")
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-4-git-send-email-gustavo@zacarias.com.ar>
 <87aa8py4ai.fsf@macbook.be.48ers.dk>
 <a0295126a06f4884db6a02d03c460db8@zacarias.com.ar>
Message-ID: <874nyxwehb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> qemu-system-i386 is deprecated.
 Gustavo> When it's present, and that doesn't hold true for every distro, it's
 Gustavo> just a symlink to qemu-system-x86_64.

Ok

 >> And then change this line.
 >> Please keep it on ttyS0.

 Gustavo> Any particular reason for this on x86?
 Gustavo> It would make things simpler to test graphics apps (X11) keeping it
 Gustavo> PC-like IMHO.

Just to keep it closer to the other configs (E.G. the versatile
config). What's the problem with running X11 from a getty on ttyS0?

-- 
Bye, Peter Korsgaard
