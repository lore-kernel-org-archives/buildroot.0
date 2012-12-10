From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 09:55:35 +0100
Subject: [Buildroot] [PATCH] ltrace: bump to version 0.7.2
In-Reply-To: <87vccathtj.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 10 Dec 2012 09:47:04 +0100")
References: <1355061456-7191-1-git-send-email-gustavo@zacarias.com.ar>
 <87vccathtj.fsf@dell.be.48ers.dk>
Message-ID: <87r4mythfc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
 Gustavo> Bump ltrace to version 0.7.2 which includes my ppc fixup patch.

 Peter> Sure about that? I don't see it in the tarball, and the autobuilder
 Peter> fails:

 Peter> http://autobuild.buildroot.net/results/97e80616ffea597e32e299b7357afc1dc572e057/build-end.log

Ahh, found it - You forgot to update the download URL, so it would
download the 0.7.1 version instead - Fixed.

-- 
Bye, Peter Korsgaard
