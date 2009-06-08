From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jun 2009 14:49:41 +0200
Subject: [Buildroot] issue with gcc 4.4.0 & sqllite  & U-boot
In-Reply-To: <6016AF82C3F04F2584DF63620FA0600D@apexjs> (Sagaert Johan's
	message of "Mon\, 8 Jun 2009 14\:38\:17 +0200")
References: <6016AF82C3F04F2584DF63620FA0600D@apexjs>
Message-ID: <878wk2ubyy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> When building with the GCC 4.4.0 toolchain i noticed that
 Sagaert> sqllite no longer works.

Yes, there seems to be quite some problems with 4.4.x / programs not
fixed yet - That's why 4.3. is still default.

-- 
Bye, Peter Korsgaard
