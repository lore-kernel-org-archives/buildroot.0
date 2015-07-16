From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:36:49 +0200
Subject: [Buildroot] [PATCH] Add missing checksum for host-tar.
In-Reply-To: <1437081313-8271-1-git-send-email-hollis_blanchard@mentor.com>
References: <1437081313-8271-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20150716233649.7d0724ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hollis Blanchard,

On Thu, 16 Jul 2015 14:15:13 -0700, Hollis Blanchard wrote:
> This fixes a very early error in a fresh build:
> "ERROR: No hash found for tar-1.28.cpio.gz"
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  package/tar/tar.hash |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

I've applied after fixing the commit title. The commit title for
packages should always look like "<package>: <description>", so I've
changed it to:

	tar: add missing hash for the host variant

Indeed we talk more about "hashes" than "checksums" in Buildroot.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
