From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 23:48:31 +0200
Subject: [Buildroot] [git commit] attr: build fix for GCC < 4.5
In-Reply-To: <20180731193941.7326C8A693@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 31 Jul 2018 21:45:26 +0200")
References: <20180731193941.7326C8A693@busybox.osuosl.org>
Message-ID: <87d0u8rbyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f910320143c12b9bed27733640e4c5441afe0f32
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > GCC 4.4 and before do not support a message associated to the
 > "deprecated" gcc attribute. Since such messages are not that useful in
 > the context of Buildroot, this commit adds a patch that removes them
 > in the attr source code.

 > Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
