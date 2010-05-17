From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 May 2010 09:49:45 +0200
Subject: [Buildroot] [PATCH 3/8] libcap: fix build failure
In-Reply-To: <e9598edb22c53d1463e61c2a6c3427ca7273d908.1273836748.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 14 May 2010 13:37:26 +0200")
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<e9598edb22c53d1463e61c2a6c3427ca7273d908.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aarz0xye.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On a x86-64 host, libcap tried to install things in
 Thomas> $(STAGING_DIR)/lib64 and $(TARGET_DIR)/lib64. Therefore, pass lib= and
 Thomas> prefix=, as required by the strange build system used by libcap.

Wouldn't that be /USR/lib64 -> /USR/lib ?

-- 
Bye, Peter Korsgaard
