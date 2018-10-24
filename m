From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 17:52:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/mariadb: add option to disable
 build of embedded server
In-Reply-To: <20181018185920.16430-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 18 Oct 2018 20:59:20 +0200")
References: <20181018185920.16430-1-bernd.kuhls@t-online.de>
Message-ID: <87d0rz8hq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Size of output/target/usr:
 > with embedded: 1,7G
 > without embedded: 648M

 > This config option saves space on the target if the embedded server
 > is not used by any other package:

 > https://mariadb.com/kb/en/library/embedded-mariadb-interface/
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
