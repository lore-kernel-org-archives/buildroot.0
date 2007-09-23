From: ross beazley <rossbeazley@lycos.co.uk>
Date: Sun, 23 Sep 2007 07:59:31 +0000
Subject: [Buildroot] Cant get mplayer to build on x86 unless CFLAGS has
	-fomit-frame-pointer
Message-ID: <183560612499095@lycos-europe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone had success getting mplayer to build on an x86. I had to modify the .mk file to include -fomit-frame-pointer in the CFLAGS.

CFLAGS="$(TARGET_CFLAGS) -fomit-frame-pointer" \

Is this required because of something else going on with uclibc I can look into?
Is there a better way to include this CFLAG?
Would it interfere with other builds and make them break?

Buildroot is a great product, well impressed, keep up the good work! :)


cheers

ross

Lycos email has 300 Megabytes of free storage... Get it now at mail.lycos.co.uk
