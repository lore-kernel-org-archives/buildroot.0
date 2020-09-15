From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:10:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/python: do not install MS
 Windows installers on the target
In-Reply-To: <20200912115622.134543-2-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 12 Sep 2020 13:56:22 +0200")
References: <20200912115622.134543-1-titouan.christophe@railnova.eu>
 <20200912115622.134543-2-titouan.christophe@railnova.eu>
Message-ID: <87mu1qud07.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Buildroot generates Linux systems, so there is no need to have
 > MS Windows executables in there.

 > This reduces the target filesystem size by about 600kB:
 > $ du -hcs usr/lib/python2.7/distutils/command/wininst-*.exe
 > 60K usr/lib/python2.7/distutils/command/wininst-6.0.exe
 > 64K usr/lib/python2.7/distutils/command/wininst-7.1.exe
 > 60K usr/lib/python2.7/distutils/command/wininst-8.0.exe
 > 192K    usr/lib/python2.7/distutils/command/wininst-9.0.exe
 > 220K    usr/lib/python2.7/distutils/command/wininst-9.0-amd64.exe
 > 596K    total

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
