From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jan 2013 15:02:51 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-instrument-build
In-Reply-To: <cover.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <50FBF90B.8030505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/13 00:41, Yann E. MORIN wrote:
> Although I've tested it with external and internal toolchain backends (not
> crosstool-NG for now), and although it does work, I expect some polishing
> to be required. For example, the date is not displayed for the file system
> images steps (I suspect it's due to second expansion being needed for
> images, which is not for packages).

  I consider that a bug in fs/common.mk. Patch follows to make things 
more consistent with pkg-generic.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
