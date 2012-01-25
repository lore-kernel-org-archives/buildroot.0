From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 25 Jan 2012 11:23:15 +0100
Subject: [Buildroot] uclibc 0.33-rcx build error : cc1: error: unrecognized
	command line option "-mlittle-endian"
Message-ID: <8DF7738D9C7143DC8D6816D185A51611@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 

 

I tried to build the 0.9.33 version because i have problems with a bug in 0.9.32.1 

 

But the 0.9.33-rc* build fails :  (ARM 9 target )

cc1: error: unrecognized command line option "-mlittle-endian"

 

something is wrong in uclibc 0.9.32.1 that seems to cause this :

http://mail.gnome.org/archives/libsoup-list/2012-January/msg00005.html 

( runnning libsoup from a thread is not working, from main thread it works .)

 

 

I did a git pull but I see no 32. and 32.1 tags in the git  log so its difficult to find out why the 32 works and the 32.1 not.

 

Regards  .

 

Sagaert Johan

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120125/1b939c09/attachment.html>
