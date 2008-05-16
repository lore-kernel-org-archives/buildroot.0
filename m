From: Ram kumar <ramkumar.research@gmail.com>
Date: Sat, 17 May 2008 04:40:04 +0530
Subject: [Buildroot] lockfile-progs 404 not found error
Message-ID: <6306c640805161610n5075970auf0abad5f37e6a501@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
       Iam trying to build a development environment using the buildroot for
atmel chip AT91SAM9260.

The buildroot builds everything but it stops at a point lockfile-progs.It is
trying to get connected  to http://ftp.debian.org and looks for the file
progs_0.1.11.tar.gz.

But the file name in debian.org has been changed to progs_0.1.11-0.1.tar.gz.

Hers is the error message which iam seeing in the shell ?

wget --passive-ftp -nd  -P /buildroot/dl "http://ftp.debian.org
"/debian/pool/main/l/lockfile-progs//lockfile-progs_0.1.11.tar.gz
--03:56:16--
http://ftp.debian.org/debian/pool/main/l/lockfile-progs//lockfile-progs_0.1.11.tar.gz
           => `/buildroot/dl/lockfile-progs_0.1.11.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
03:56:17 ERROR 404: Not Found.

Then the build stops.Please guide me whether i have apply any patch for the
error ?

Regards,
Ram
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080517/79f15a68/attachment.htm 
