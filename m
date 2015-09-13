From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 22:26:34 +0200
Subject: [Buildroot] [PATCH] toolchain-external/CodeSourcery MIPS
	2015.05: fix lib-names headers
In-Reply-To: <1439805352-41186-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 17 Aug 2015 10:55:52 +0100")
References: <1439805352-41186-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87bnd6cbgl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The CodeSourcery MIPS 2015.05 toolchain has some missing headers we need
 > to create manually in order to avoid compilation errors. A bug has been
 > already reported and fixed upstream, and the fix will be included in the
 > next release.

 > Fixes:
 >   http://autobuild.buildroot.net/results/bea/bea76392dec5c8e1bcea8be990ad109c6d27e947/
 >   http://autobuild.buildroot.net/results/64f/64f2b6b6e60d5c2d9537ad6891211cda6baaf6d5/
 >   ...and many more.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
