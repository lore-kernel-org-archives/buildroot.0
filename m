From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:31:40 +0200
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.0.1
In-Reply-To: <20200407211238.11904-1-ps.report@gmx.net>
References: <20200407211238.11904-1-ps.report@gmx.net>
Message-ID: <20200408213140.0a4f6706@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 23:12:38 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...1-Fix-FBXConverter-use-proper-64-bit-constant.patch | 10 ++++++----
>  package/assimp/assimp.hash                             |  4 ++--
>  package/assimp/assimp.mk                               |  2 +-
>  3 files changed, 9 insertions(+), 7 deletions(-)

Applied, thanks. Could you submit the patch we have to the upstream
project?

Also did you test building the qt53d package after this update? It is
the only package in Buildroot that uses assimp.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
