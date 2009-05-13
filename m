From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 May 2009 22:20:51 +0200
Subject: [Buildroot] [GIT PULL] For 2009.05-rc2
In-Reply-To: <d6cda7730905131309t2c0f8f21m2841072f983c71ac@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 13 May 2009
	17\:09\:01 -0300")
References: <d6cda7730905131309t2c0f8f21m2841072f983c71ac@mail.gmail.com>
Message-ID: <87skj8rbz0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Peter,
 Thiago> The following changes since commit b124f62e23c3dc35ed0a74e68c2c596b30ea3d7c:
 Thiago>   Peter Korsgaard (1):
 Thiago>         Merge branch 'master' of
 Thiago> git://git.buildroot.net/~correa/git/buildroot into test

 Thiago> are available in the git repository at:

 Thiago>   git://git.buildroot.net/~correa/git/buildroot 2009.05

Could you also please send (your own atleast) patches to the mailing
list for easy review?

Use something like:

git format-patch master
git send-email --to buildroot at uclibc.org 00*.patch

-- 
Bye, Peter Korsgaard
