From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Oct 2008 17:37:43 +0200
Subject: [Buildroot] Kernel header installed with external toolchain ?
In-Reply-To: <20081022171035.451de23c@surf> (Thomas Petazzoni's message of
	"Wed\, 22 Oct 2008 17\:10\:35 +0200")
References: <20081022171035.451de23c@surf>
Message-ID: <87r668k5dk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hi,
 Thomas> I'm using Buildroot with an external toolchain, but after every cleanup
 Thomas> of the tree, the next 'make' will trigger the download of the kernel
 Thomas> source code and the installation of kernel headers. I'm wondering why
 Thomas> this is necessary, since the external toolchain already have the
 Thomas> headers.

It shouldn't redownload unless you remove your dl dir.

 Thomas> Isn't this a bug of the external toolchain management ?

Sounds like it. Sorry, I'm not using the external toolchain stuff, but
patches are welcome.

-- 
Bye, Peter Korsgaard
