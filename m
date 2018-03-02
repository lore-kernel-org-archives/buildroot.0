From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 13:58:01 +0100
Subject: [Buildroot] host-lz4 bug on LTS 2017.02.10
In-Reply-To: <20180302113812.GA29093@salem.gmr.ssr.upm.es> (Alvaro G. M.'s
 message of "Fri, 2 Mar 2018 12:38:12 +0100")
References: <20180302113812.GA29093@salem.gmr.ssr.upm.es>
Message-ID: <87r2p2d486.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alvaro" == Alvaro G M <alvaro.gamez@hazent.com> writes:

 > Hi,
 > I've tracked this issue compiling host-lz4. Offending commit is this one
 > (found via git bisect)

 > 17cf7e511e6919d5b6744deb21770c2d0ea922a9
 > lz4: install programs as well as libraries

 > I attach at the end the defconfig file that produced this log, using
 > Microblaze, but I've found that the same error happens on x86_64.

Please use 2017.02.11 instead. A backport of lz4-1.7.5 was missing on
the 2017.02.x branch.

-- 
Bye, Peter Korsgaard
