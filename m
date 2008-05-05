From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 May 2008 23:50:24 +0200
Subject: [Buildroot] booting root filesystem over nfs
In-Reply-To: <814162.35883.qm@web31804.mail.mud.yahoo.com> (Pink Boy's message
	of "Mon\, 5 May 2008 13\:49\:14 -0700 \(PDT\)")
References: <814162.35883.qm@web31804.mail.mud.yahoo.com>
Message-ID: <877ie8l8tb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pink" == Pink Boy <dasfoo@yahoo.com> writes:

Hi,

 Pink> I'm having some issues mounting a root file system over
 Pink> NFS on Ubuntu.  Might be related.  Just to get it to mount
 Pink> I had to manually add no_root_squash to the etc/exports 

Sure, no_root_squash is needed for booting, otherwise root only has
access as nobody.

This is not related to buildroot though.

-- 
Bye, Peter Korsgaard
