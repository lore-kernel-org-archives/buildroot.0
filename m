From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 13:40:48 +0200
Subject: [Buildroot] [PATCH] busybox: provide /etc/mdev.conf if mdev is
	used
In-Reply-To: <4E1AD42A.8000305@lucaceresoli.net> (Luca Ceresoli's message of
 "Mon, 11 Jul 2011 12:44:58 +0200")
References: <1310140073-14231-1-git-send-email-luca@lucaceresoli.net>
 <8739igy7e9.fsf@macbook.be.48ers.dk>
 <4E1ACBC3.7020806@lucaceresoli.net>
 <8762n9p13n.fsf@macbook.be.48ers.dk>
 <4E1AD42A.8000305@lucaceresoli.net>
Message-ID: <871uxxoxj3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 Luca> Ok, this is much more clear now. Thanks.

Great.

 >> Historically this is done in two ways (the 1st has existed for a
 >> very long time, the 2nd is relatively new):
 >> 
 >> - Use a custom rootfs skeleton with tweaked configuration files
 >> - Use a post-build script to tweak configuration files

 Luca> There's actually a third way, that is to put custom files in
 Luca> package/costomize/source. I use it for files that I need to customize,
 Luca> nut that would be overwritten by BR if they were in the custom
 Luca> skeleton.

True, but that imho just pampers over bugs where BR wrongly overwrites
files it shouldn't.

-- 
Bye, Peter Korsgaard
