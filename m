From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 10:37:22 +0200
Subject: [Buildroot] [PATCH] Change Samba download URL to the generic
	ftp.samba.org
In-Reply-To: <d6cda7730801031657r673649f6o85d29a18a897e3cc@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Thu\, 3 Jan 2008
	22\:57\:41 -0200")
References: <d6cda7730801031657r673649f6o85d29a18a897e3cc@mail.gmail.com>
Message-ID: <874p7j5iv1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> This patch changes SAMPA_SITE to ftp://ftp.samba.org/pub/samba/stable
 Thiago> instead of ftp://us4.samba.org/pub/samba/.

 Thiago> As it's obvious, not everyone lives in the US. *smile*
 Thiago> It might be down, or it's just me, but from Brazil, I can't connect to
 Thiago> us4.samba.org. On the other hand, ftp.samba.org works just nicely.

 Thiago> Please apply.

Better late than never ;)

I changed it to use http instead of ftp like we mostly do.

-- 
Bye, Peter Korsgaard
