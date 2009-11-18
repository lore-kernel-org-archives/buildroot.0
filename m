From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Wed, 18 Nov 2009 10:56:35 +0100
Subject: [Buildroot] at - fails if no HOST-sendmail.
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67014825A8@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Just encountered an issue with the package 'at' .. when cross-compiling,
and I do not have any clue how I would fix it (maybe someone can help).

When cross-building 'at' on a HOST-system that has a NO 'sendmail'
program installed the compile bails out with the error "No mail command
specified" . ( FYI: sendmail does exist (is being build) on the TARGET
(but not on the host))

For the time-being I have installed 'nullmailer' on the host, which
makes my build work .. but this means that './configure' is looking at
the HOST-sendmail in stead of the TARGET-sendmail and this is where it
goes wrong !

Anyone knows a 'better' fix/solution ?



Regards Noel.
