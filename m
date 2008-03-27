From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 16:44:47 +0100
Subject: [Buildroot] make clean problem and patch
In-Reply-To: <d6cda7730803270737x43efeb83o61a40a1ff5bff704@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Thu\, 27 Mar 2008
	11\:37\:54 -0300")
References: <47EB6E57.4080101@logicway.de> <20080327125053.GE13379@mx.loc>
	<d6cda7730803270737x43efeb83o61a40a1ff5bff704@mail.gmail.com>
Message-ID: <87tzisqihc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Bernhard,
 Thiago>    You are also missing dropbear, which does not have an uninstall
 Thiago> target and causes make clean to fail.

Thanks - fixed in r21516.

-- 
Bye, Peter Korsgaard
