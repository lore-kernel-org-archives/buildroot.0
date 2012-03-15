From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 23:05:02 +0100
Subject: [Buildroot] [PATCH 2/3] debug: provide an option to copy the
	gdbserver to the target
In-Reply-To: <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 14 Mar 2012 23:49:57 +0100")
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87obrxr04x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When an external toolchain is used, it is very likely that it contains
 Thomas> a pre-built version of a gdbserver that has the same version as the
 Thomas> cross-gdb included in the external toolchain. So, we now provide an
 Thomas> option that allows to copy this pre-built gdbserver to the target.

Committed, thanks.

-- 
Bye, Peter Korsgaard
