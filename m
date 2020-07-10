From: Thomas W. <thomas.chiantia@gmail.com>
Date: Fri, 10 Jul 2020 15:41:37 -0400
Subject: [Buildroot] [PATCH] Fix swupdate build by installing mtd headers as
 expected
Message-ID: <CAPxu4wfxL4rCL2Q-CKUwHS+rbvUdwjhY=b0x5CV-OkBh--qBDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

swupdate expects libmtd.h and libubi.h to be in the include folder and
not in the mtd namespace.
(see also:
https://groups.google.com/forum/#!topic/swupdate/Apv_yRLmgzY
https://groups.google.com/forum/#!topic/swupdate/gd25RIPa00w
https://groups.google.com/forum/#!topic/swupdate/gei0Gc_5j8M)

Signed-off-by: Thomas Chiantia <thomas.chiantia@gmail.com>

---
