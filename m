From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 18:10:21 +0200
Subject: [Buildroot] [PATCH 1/3] support/testing: remove references to
 host/usr
In-Reply-To: <20170705120950.23189-1-arnout@mind.be>
References: <20170705120950.23189-1-arnout@mind.be>
Message-ID: <20170705181021.12d90297@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jul 2017 14:09:48 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The tools are now installed in host/bin instead of host/usr/bin.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/testing/tests/fs/test_ext.py      | 2 +-
>  support/testing/tests/fs/test_jffs2.py    | 2 +-
>  support/testing/tests/fs/test_squashfs.py | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
