From: Ossy <ossy1980@gmx.net>
Date: Sun, 09 May 2010 22:04:58 +0200
Subject: [Buildroot] netperf build failed with rc1 version of 8th May -
	arm926t
Message-ID: <4BE7156A.5050205@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildroot mailinglist,

I tried to include the netperf tool using the current rc1, but 
unfortunatly it failed with the below output:
...
netsh.c: In function 'parse_protocol':
netsh.c:457: error: 'SOCK_DCCP' undeclared (first use in this function)
...

Please find attached my configuration.

I just skipped this tool and went on with further compilation.


Kind regards,
Marcus

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: netperf-failed.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/91bbd0b2/attachment-0001.txt>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/91bbd0b2/attachment-0001.diff>
