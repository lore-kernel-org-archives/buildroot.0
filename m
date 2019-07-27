From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jul 2019 22:44:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error
References: <20190706064236.30663-1-bernd.kuhls@t-online.de>
 <20190727223753.2211ac3f@windsurf>
Message-ID: <XnsAA99E75BA4FE2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
wrote in news:20190727223753.2211ac3f at windsurf:

> Could you give a bit more details about how including <stdio.h> can
> solve this build issue ? All this thread stuff in tvheadend isn't that
> clear, and the fact that including <stdio.h> solves the build issue
> makes it even less clear.

Hi Thomas,

the fix was proposed by the author of tvheadend:
https://tvheadend.org/issues/5667#note-7

My knowledge about the code is not sufficient enough to answer your question, 
sorry. I was glad that the fix was as easy as adding a header include.

Regards, Bernd
