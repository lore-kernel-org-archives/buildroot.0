From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Jun 2017 08:40:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/poppler: fix openjpeg support
In-Reply-To: <20170602045451.2297-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 2 Jun 2017 06:54:51 +0200")
References: <20170602045451.2297-1-bernd.kuhls@t-online.de>
Message-ID: <8737bihoy2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Since the last version bump --enable-libopenjpeg always needs a
 > parameter:
 > https://cgit.freedesktop.org/poppler/poppler/commit/configure.ac?id=65c5a5266462244130f110599ac5d1011a04216e

 > Fixes
 > http://autobuild.buildroot.net/results/557/557b9b386863b6c865bcca86a2b87c7028700ec4/
 > http://autobuild.buildroot.net/results/f27/f27380e803be50e066be1659a8512fd74d1fa6de/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
