From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:10:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3: do not install MS
 Windows installers on the target
In-Reply-To: <20200912115622.134543-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sat, 12 Sep 2020 13:56:21 +0200")
References: <20200912115622.134543-1-titouan.christophe@railnova.eu>
Message-ID: <87r1r2ud0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Buildroot generates Linux systems, so there is no need to have
 > MS Windows executables in there.

 > This reduces the target filesystem size by about 2MB:
 > $ du -hcs usr/lib/python3.8/distutils/command/wininst-*.exe
 > 60K usr/lib/python3.8/distutils/command/wininst-6.0.exe
 > 64K usr/lib/python3.8/distutils/command/wininst-7.1.exe
 > 60K usr/lib/python3.8/distutils/command/wininst-8.0.exe
 > 192K    usr/lib/python3.8/distutils/command/wininst-9.0.exe
 > 220K    usr/lib/python3.8/distutils/command/wininst-9.0-amd64.exe
 > 188K    usr/lib/python3.8/distutils/command/wininst-10.0.exe
 > 220K    usr/lib/python3.8/distutils/command/wininst-10.0-amd64.exe
 > 448K    usr/lib/python3.8/distutils/command/wininst-14.0.exe
 > 576K    usr/lib/python3.8/distutils/command/wininst-14.0-amd64.exe
 > 2,0M    total

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
