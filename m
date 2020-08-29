From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:37:01 +0200
Subject: [Buildroot] [git commit] Makefile: hide commands that build the
 package file lists at end of build
In-Reply-To: <20200829122742.BDDB4815F5@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 29 Aug 2020 14:33:21 +0200")
References: <20200829122742.BDDB4815F5@busybox.osuosl.org>
Message-ID: <87y2lxfj5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=18f6c2611898c852a10e38978249a9ce81c24163
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since commit 0e2be4db8ab01d479177a3a187c22525752195ae
 > ("package/pkg-generic: make file list logic parallel build
 > compatible"), the commands executed at the every end of the build
 > to assemble the list of files installed by the different packages
 > are visible in the make output. They are quite noisy, and clutter
 > the output.

 > The other commands in target-finalize are also hidden using "@",
 > so we should also do the same for those commands. But that hurts
 > debuggability, so we use $(Q) (the existing '@'s can be changed
 > in a followup patch).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [yann.morin.1998 at free.fr: use '$(Q)', not '@']
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
