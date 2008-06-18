From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 10:53:44 +0200
Subject: [Buildroot] Problems building nbd.
In-Reply-To: <d6cda7730806172112l67de57b4s3d5923bda024c8f1@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 18 Jun 2008
	01\:12\:51 -0300")
References: <d6cda7730806172112l67de57b4s3d5923bda024c8f1@mail.gmail.com>
Message-ID: <874p7r86p3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago>   The other option to fix nbd would be to downgrade to something below
 Thiago> 2.8, but then we would still be unable to support the next package
 Thiago> that requires glib.

 Thiago>   Any thoughts?

 Thiago>   I'm appending my glibc.mk for reference at the end.

We DO have glib packages in buildroot (1.2.x and 2.x.x) -
package/libglib12 and package/libglib2.

-- 
Bye, Peter Korsgaard
