From: Ossy <ossy1980@gmx.net>
Date: Sun, 09 May 2010 22:07:07 +0200
Subject: [Buildroot] rsync failed with rc1 plus patches until 8th May -
	arm926t
Message-ID: <4BE715EB.8010302@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildroot mailinglist,

I tried to include the rsync tool using the current rc1, but 
unfortunatly it failed with the below output:
...
In file included from ./rsync.h:887,
                  from ./rounding.c:20:
./lib/addrinfo.h:141: error: redefinition of 'struct sockaddr_storage'
...

Please find attached my configuration.

I just skipped this tool and went on with further compilation.


Kind regards,
Marcus
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: rsync-failed.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/b90ac1c9/attachment.txt>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/b90ac1c9/attachment.diff>
