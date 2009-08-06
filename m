From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Aug 2009 09:28:33 +0200
Subject: [Buildroot] v86d?
In-Reply-To: <20090806061536.23220@gmx.net> (bbj's message of "Thu\,
	06 Aug 2009 08\:15\:36 +0200")
References: <20090806061536.23220@gmx.net>
Message-ID: <87ab2dmme6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bbj17" == bbj17  <bbj17@gmx.de> writes:

 bbj17> Hi,
 bbj17> I use v86d with buildroot without any problems.
 bbj17> You should configure the package: "./configure --with-x86emu" and not use lrmi. Lrmi is smaller but not supported for x86_64.?

 bbj17> Build it: $(MAKE) CC=$(TARGET_CC) -C $(V86D_DIR) KDIR=$(LINUX_DIR)

Care to contribute a patch adding it to BR?

-- 
Bye, Peter Korsgaard
