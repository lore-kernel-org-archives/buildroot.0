From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Nov 2012 17:28:03 +0100
Subject: [Buildroot] [PATCH v4] at91bootstrap: fix overlap linker issue
In-Reply-To: <1352198903-6297-1-git-send-email-gregory.hermant@calao-systems.com>
 (Gregory Hermant's message of "Tue, 6 Nov 2012 11:48:23 +0100")
References: <1352198903-6297-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <878vac9i0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory Hermant <gregory.hermant@calao-systems.com> writes:

 Gregory> The linker script of the at91bootstrap package has to be
 Gregory> modified when built from gcc-4.6.x version. Indeed a section
 Gregory> named text.startup is created and has to be added into the
 Gregory> text section.

Committed, thanks.

-- 
Bye, Peter Korsgaard
