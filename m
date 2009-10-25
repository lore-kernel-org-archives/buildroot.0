From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Oct 2009 21:33:58 +0100
Subject: [Buildroot] [RFC] Don't hide all editors in menuconfig
In-Reply-To: <4AE02F63.8080302@free.fr> (Julien Boibessot's message of "Thu\,
	22 Oct 2009 12\:09\:39 +0200")
References: <4AE02F63.8080302@free.fr>
Message-ID: <87ws2jfc21.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 Julien> Hi,
 Julien> I probably misunderstood the use of BR2_PACKAGE_BUSYBOX_SHOW_OTHERS but
 Julien> I'm in a case where I have to hide packages provided by Busybox and use
 Julien> Nano as editor.

The SHOW_OTHERS toggle (and the HIDE_OTHERS we had earlier), was to make
it easier for users by hiding packages that have "equivalent" busybox
applets - Normally the busybox applets are smaller and more often used
(and hence better tested) in buildroot.

But I agree, that calling the busybox vi implementation equivalent to
all the editors we have is probably a bit of a stretch ..

So, committed - Thanks!

-- 
Bye, Peter Korsgaard
