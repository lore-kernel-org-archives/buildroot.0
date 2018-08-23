From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:36:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.7.0
In-Reply-To: <20180506092903.25598-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 6 May 2018 11:29:03 +0200")
References: <20180506092903.25598-1-bernd.kuhls@t-online.de>
Message-ID: <87tvnk3meu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Increased minimum gcc version to 4.8 as mentioned in the Changelog:
 > https://wiki.znc.in/ChangeLog/1.7.0

 > Removed all patches:
 > - 0001 was applied upstream:
 > https://github.com/znc/znc/commit/483074cbf82a48a3ff01838fcbaec00553d1882c

 > - 0002 is not needed anymore after upstream switched Csocket to a git
 >   submodule:
 > https://github.com/znc/znc/commit/9166e6ed40f0c7a85eee0d024b12510c13863f55#diff-8a725997e024d92d67b33a90cffb8342

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
