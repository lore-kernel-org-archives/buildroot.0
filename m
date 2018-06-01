From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jun 2018 17:52:46 +0200
Subject: [Buildroot] [git commit branch/next] configs/socrates_cyclone5:
 change over to current upstream releases
In-Reply-To: <20180601112206.5e6eff0f@windsurf> (Thomas Petazzoni's message of
 "Fri, 1 Jun 2018 11:22:06 +0200")
References: <20180528194941.1136A82854@busybox.osuosl.org>
 <20180601112206.5e6eff0f@windsurf>
Message-ID: <871sdqzepd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Peter,
 > On Mon, 28 May 2018 21:50:47 +0200, Thomas Petazzoni wrote:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=ef94c736ec460e56b82a5a45819f7adce787d488
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
 >> 
 >> Since all cyclone5 development changes are upstream, change over to an
 >> upstream release of the Linux kernel and u-boot for buildroot.
 >> 
 >> Signed-off-by: Florian La Roche <Florian.LaRoche@googlemail.com>
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > I have applied this patch to next, but in fact I believe it should have
 > gone into master, as it should fix the build of the socrates_cyclone5
 > defconfig: https://gitlab.com/buildroot.org/buildroot/-/jobs/71727024.

Ok, cherry picked for master as well, thanks.

-- 
Bye, Peter Korsgaard
