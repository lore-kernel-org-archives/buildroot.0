From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Jul 2014 23:38:38 +0200
Subject: [Buildroot] Clarify the Intel driver related patches in
	patchwork
References: <20140729092214.539f130e@free-electrons.com>
 <20140729172109.GA1263@bwidawsk.net>
Message-ID: <XnsA379F084CD782berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Ben Widawsky <ben@bwidawsk.net> wrote in 
news:20140729172109.GA1263 at bwidawsk.net:

> A patch (not in that list) to bump to .913 would solve all problems for
> me. It seems like Bernd would be okay with this as well, though he sent
> that mail only to me, "So updating buildroot to 2.99.914 is ok for me
> now." I presume he meant .913.

Hi,

no, I meant .914, which was released only several hours after .913 ;)
I just sent a new series for review which also cleans up the DRI mess now 
present in the intel driver configure.ac. I hope I did not miss a combination 
of options, please test my new patch.

Regards, Bernd
