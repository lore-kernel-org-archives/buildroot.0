From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 Jul 2015 07:12:49 -0300
Subject: [Buildroot] [PATCH 1/1] btrfs-progs: drop dependency on acl and
	attr
In-Reply-To: <1436167524-21170-1-git-send-email-cvubrugier@fastmail.fm>
References: <1436167524-21170-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <559A54A1.2060607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/07/15 04:25, Christophe Vu-Brugier wrote:

> btrfs-progs does not depend on libacl since version v4.0.1:
>
>    ab5984f btrfs-progs: convert: drop dependency on sys/acl.h
>    https://git.kernel.org/cgit/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=ab5984ff6cce6f12063720b6dafc1afcd6606853
>
> Moreover, btrfs-progs does not depend on attr since version v3.14:
>
>    b5fe148 btrfs-progs: include <sys/xattr.h> instead of <attr/xattr.h>
>    https://git.kernel.org/cgit/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=b5fe148715ea295e2b951ec6c90409b9d81978d8
>
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Indeed, thanks for looking into this.
Regards.
