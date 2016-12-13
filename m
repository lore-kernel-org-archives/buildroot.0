From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 10:56:29 +0100
Subject: [Buildroot] [PATCH 1/2] policycoreutils: CPPFLAGS undefine
 _FILE_OFFSET_BITS
In-Reply-To: <1481602868-46581-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1481602868-46581-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20161213105629.1d0609fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 22:21:07 -0600, Matt Weber wrote:
> Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> large file support.
> 
> Similar action was taken previously for CFLAGS.
> 
> Resolves:
> http://autobuild.buildroot.net/results/4cb/4cb70d776bee01f1284e0c0be5b3fb5f1011353a/
> http://autobuild.buildroot.net/results/f43/f438149e7d83475d425e1c1f17550f3cf5f69340/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/policycoreutils/policycoreutils.mk | 2 ++
>  1 file changed, 2 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
