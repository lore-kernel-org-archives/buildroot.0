From: Will Bickford <WBickford@efji.com>
Date: Tue, 22 Jan 2013 21:54:21 +0000
Subject: [Buildroot] Question about Buildroot-Based External Toolchains with
	2012.11.1
Message-ID: <9A206D81F45CAE4EB5A38D7E602F5AEA0B772447@TRANSXCH01.transcrypt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm confused by problems I'm seeing when deploying a pre-computed toolchain using Buildroot 2012.11.1 for both the target and the toolchain. Previously I've used the external toolchain feature from Buildroot 2010.05 without any problems.

Related discussion:
http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/45427

It is unclear to me how I'm supposed to strip the usr/ directory from the toolchain archive. The naive approach (mentioned in the discussion linked above) results in a broken toolchain. Is there a documented way to resolve this problem?

Documentation:
http://buildroot.uclibc.org/downloads/manual/manual.html#external-toolchain

Best Regards,

William Bickford
EF Johnson Technologies, Inc.
O  402.474.4800
E   wbickford at efji.com
www.efjohnson.com
This e-mail transmission, and any documents, files or previous e-mail messages attached to it, may contain confidential information. If you are not the intended recipient, or a person responsible for delivering it to the intended recipient, you are hereby notified that any disclosure, distribution, review, copy or use of any of the information contained in or attached to this message is STRICTLY PROHIBITED. If you have received this transmission in error, please immediately notify us by reply e-mail, and destroy the original transmission and its attachments without reading them or saving them to disk. Thank you.
