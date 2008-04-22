From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Apr 2008 15:40:09 +0200
Subject: [Buildroot] Failing NFS root mount
In-Reply-To: <067701c8a475$2df6d860$ad289e86@LPSC0173W> (Guillaume Dargaud's
	message of "Tue\, 22 Apr 2008 14\:34\:08 +0200")
References: <067701c8a475$2df6d860$ad289e86@LPSC0173W>
Message-ID: <87fxteovnq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

Hi,

 Guillaume> I'm now trying to use a local kernel but an NFS mount for the root 
 Guillaume> filesystem.

..

 Guillaume> [    4.392920] Freeing unused kernel memory: 76k init

 Guillaume> And then it hangs.

Congrats, now you get to debug it ;)

Does it work with nfs over tcp? E.G. nfsroot=<ip>:<path>,tcp
Does init=/bin/date or init=/bin/sh work?

What network traffic do you see with wireshark?

-- 
Bye, Peter Korsgaard
