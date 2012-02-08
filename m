From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 09:05:46 +0100
Subject: [Buildroot] Reviewing the Buildroot ELC presentation slides
In-Reply-To: <CAAXf6LUubuiS01Xqv+h+vMBSCMgH9FEfbkEAP2v4bdWQeXAynA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 8 Feb 2012 08:02:23
 +0100")
References: <20120207224611.0d9e45d5@skate>
 <CAAXf6LUubuiS01Xqv+h+vMBSCMgH9FEfbkEAP2v4bdWQeXAynA@mail.gmail.com>
Message-ID: <877gzxzr51.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> slide 14: an uClibc --> here I think it should be 'a uClibc' as you
 Thomas> pronounce as 'you-see-libc'.

And there seems to be something missing in that line. I suggest using
'.. build a uClibc based toolchain'.

slide 27: (external) 'copies the original toolchain sysroot in the
host/usr'. I would use 'copy to' rather than 'copy in'.

slide 29: s/typle/tuple/. You use host/usr, but only target/ - Probably
drop "usr".

slide 38: maybe explain when you would want to autoreconfigure
(E.G. when patching auto* files).

Otherwise it looks good to me, thanks!

-- 
Bye, Peter Korsgaard
