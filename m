From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Jul 2009 11:45:26 +0200
Subject: [Buildroot] ssh
In-Reply-To: <60114.172.16.221.10.1246290853.squirrel@172.16.0.251>
	(nfrench@xtale.biz's message of "Mon\,
	29 Jun 2009 15\:54\:13 -0000 \(Europe\/London\)")
References: <60114.172.16.221.10.1246290853.squirrel@172.16.0.251>
Message-ID: <878wj7ctah.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nfrench" == nfrench  <nfrench@xtale.biz> writes:

Hi,

 nfrench> all was good except no libgcc installed, so I have added and
 nfrench> now done a strip -s on it now down to 74k form 300k

 nfrench> should it not of installed it and stripped it for me I
 nfrench> checked and I have checked

 nfrench> Build/install a shared libgcc

The problem is that x86-64 installs them in lib64, and buildroot was
only trying to copy them from lib - It is now fixed in git.

-- 
Bye, Peter Korsgaard
