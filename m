From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 11:51:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/nano: bump version to 2.8.7
In-Reply-To: <20170913090223.9995-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 13 Sep 2017 11:02:23 +0200")
References: <20170913090223.9995-1-bernd.kuhls@t-online.de>
Message-ID: <871snb2ag4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Added upstream patch to fix build error:
 > move.o: In function `do_page_up':
 > move.c:(.text+0x150): undefined reference to `leftedge_for'
 > move.o: In function `do_page_down':
 > move.c:(.text+0x20c): undefined reference to `leftedge_for'

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
