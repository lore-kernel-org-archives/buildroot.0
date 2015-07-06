From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 14:02:45 +0200
Subject: [Buildroot] [PATCH 1/1] btrfs-progs: drop dependency on acl and
 attr
In-Reply-To: <1436167524-21170-1-git-send-email-cvubrugier@fastmail.fm>
References: <1436167524-21170-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20150706140245.3af838f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Mon,  6 Jul 2015 09:25:24 +0200, Christophe Vu-Brugier wrote:
> btrfs-progs does not depend on libacl since version v4.0.1:
> 
>   ab5984f btrfs-progs: convert: drop dependency on sys/acl.h
>   https://git.kernel.org/cgit/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=ab5984ff6cce6f12063720b6dafc1afcd6606853
> 
> Moreover, btrfs-progs does not depend on attr since version v3.14:
> 
>   b5fe148 btrfs-progs: include <sys/xattr.h> instead of <attr/xattr.h>
>   https://git.kernel.org/cgit/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=b5fe148715ea295e2b951ec6c90409b9d81978d8
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/btrfs-progs/Config.in      | 2 --
>  package/btrfs-progs/btrfs-progs.mk | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
