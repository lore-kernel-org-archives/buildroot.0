From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 22:00:28 +0200
Subject: [Buildroot] [PATCH 1/3] ncftp: specify ln -sf to remove
	existing destination files
In-Reply-To: <1381756890.15266.1.camel@phoenix> (Axel Lin's message of "Mon,
 14 Oct 2013 21:21:30 +0800")
References: <1381756890.15266.1.camel@phoenix>
Message-ID: <87k3hfpqqr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> This fixes below build error when executing "make ncftp-dirclean; make".
 Axel> ln -s /usr/bin/ncftpbatch /opt/test/br-x86/buildroot/output/target/usr/bin/ncftpspooler
 Axel> ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/target/usr/bin/ncftpspooler': File exists
 Axel> make: *** [/opt/test/br-x86/buildroot/output/build/ncftp-3.2.5/.stamp_target_installed] Error 1

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
