From: Will Buik <willbuik@gmail.com>
Date: Wed, 17 Jan 2007 21:18:55 -0500
Subject: [Buildroot] flex and ed packages get 404 error
Message-ID: <1d09f8b80701171818l51a06929s2c09c5f3fe711da0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have tried to enable the flex and ed packages, but buildroot seems
not to be able to find the files:

wget --passive-ftp -P /home/will/box/buildroot/buildrootdev/dl
http://ftp.debian.org/debian/pool/main/e/ed/ed_0.2-19.diff.gz
--21:09:39--  http://ftp.debian.org/debian/pool/main/e/ed/ed_0.2-19.diff.gz
           => `/home/will/box/buildroot/buildrootdev/dl/ed_0.2-19.diff.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
21:09:39 ERROR 404: Not Found.

wget --passive-ftp -P /home/will/box/buildroot/buildrootdev/dl
http://ftp.debian.org/debian/pool/main/f/flex/flex_2.5.4a.orig.tar.gz
--21:14:17--  http://ftp.debian.org/debian/pool/main/f/flex/flex_2.5.4a.orig.tar.gz
           => `/home/will/box/buildroot/buildrootdev/dl/flex_2.5.4a.orig.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found

I was able to manualy download the tar for flex but it then needed a
diff as well and I could only find it on servers which said it didn't
exist anymore.

I have been having this error for several days so I'm not sure if it
was just a temporary server error.

PS: I'm really sorry if this has been brought up already, I just
turned buildroot mailing list delivery back on.
