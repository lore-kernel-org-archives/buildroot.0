From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Mon, 06 Apr 2015 00:58:16 +0200
Subject: [Buildroot] Target to create missing hashes.
Message-ID: <5521BE08.9020304@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann ,

Would be nice to have a convenience make target to create missing hashes.
(Comes in handy for custom packages not available in upstream buildroot, 
or when bumping versions before
posting the patches to the mailing list.)

  make  <pkg>-sha256_hash

Maybe the missing hash warnings should also be redirected to a file 
.missing_hashes, they mostly go unnoticed otherwise while building.

Best Regards , Johan
