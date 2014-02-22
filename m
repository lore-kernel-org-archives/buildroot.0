From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 21:45:43 +0100
Subject: [Buildroot] [PATCH 2/3] manual: switch BR2_EXTERNAL examples to
	use	absolute paths
In-Reply-To: <48973489-6ffd-4d9d-b8ad-0d9392ebe929@email.android.com> (Thomas
 De Schampheleire's message of "Sat, 22 Feb 2014 13:09:39 +0100")
References: <cover.1393020340.git.yann.morin.1998@free.fr>
 <c885b064a16923e79d388249bd4ea7161a4bac22.1393020340.git.yann.morin.1998@free.fr>
 <48973489-6ffd-4d9d-b8ad-0d9392ebe929@email.android.com>
Message-ID: <87ppmeswp4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
 >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> 
 >> Although it is possible to use relative paths, there are a few pitfalls
 >> whith doing so.

 > With, but actually I think when would be better.

..
 
 >> -The +BR2_EXTERNAL+ path can be either an absolute or a relative path,
 >> +*Note:* the +BR2_EXTERNAL+ path can be either an absolute or a relative path,
 >> but if it's passed as a relative path, it is important to note that it
 >> -is interpreted relatively to the main Buildroot source directory, not
 >> +is interpreted relatively to the main Buildroot source directory, *not*

 > I may be wrong, but I also think it should be 'relative' here...

I think so too. Committed with that fixed, thanks both.

-- 
Bye, Peter Korsgaard
