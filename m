From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:39:46 +0100
Subject: [Buildroot] [PATCH 3/3] Makefile: assemble package file lists
 before calling post-build scripts
In-Reply-To: <20200318155814.567-3-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 18 Mar 2020 16:58:13 +0100")
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
 <20200318155814.567-3-patrickdepinguin@gmail.com>
Message-ID: <87r1xdc4hp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Post-build scripts may want to do something based on the list of files
 > installed by a package. However, since commit
 > 0e2be4db8ab01d479177a3a187c22525752195ae the final packages-file-lists.txt
 > file is only created _after_ the post-build scripts.

 > Move the assembly of the file lists upwards, before the post-build scripts.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
