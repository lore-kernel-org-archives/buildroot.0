From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Jun 2010 15:49:27 +0200
Subject: [Buildroot] package/games/Config.in usage
In-Reply-To: <4C1A1F22.70500@free.fr> (Julien Boibessot's message of "Thu, 17
	Jun 2010 15:12:02 +0200")
References: <4C1A1F22.70500@free.fr>
Message-ID: <87zkytbwgo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 Julien> Hello,
 Julien> it seems package/games/Config.in is not used. Indeed package/Config.in
 Julien> do not "source" it but copy its content (line 76).

 Julien> What is the actual philosophy in BR: regroup packages by "classes" (ex
 Julien> games, multimedia...) in package/ subdirs and then source these
 Julien> sub-Config.in in package/Config.in or put all packages in package/ and
 Julien> organize the stuff in package/Config.in ?
 Julien> (I prefer the second one)

Me too.

-- 
Bye, Peter Korsgaard
