From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:36:53 +0200
Subject: [Buildroot] [PATCH] Makefile: hide commands that build the
 package file lists at end of build
In-Reply-To: <20200829122055.131928-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 29 Aug 2020 14:20:54 +0200")
References: <20200829122055.131928-1-thomas.petazzoni@bootlin.com>
Message-ID: <873645gxqi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since commit 0e2be4db8ab01d479177a3a187c22525752195ae
 > ("package/pkg-generic: make file list logic parallel build
 > compatible"), the commands executed at the every end of the build to
 > assemble the list of files installed by the different packages are
 > visible in the make output. They are quite noisy, and clutter the
 > output.

 > The other commands in target-finalize are also hidden using "@", so do
 > the same for those commands.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
