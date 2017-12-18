From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Dec 2017 11:49:46 +0100 (CET)
Subject: [Buildroot] [PATCH v8 0/9] Add support for the Rust programming
 language
In-Reply-To: <706201859.95242518.1513592711039.JavaMail.root@zimbra32-e6>
Message-ID: <250859205.95342579.1513594186361.JavaMail.root@zimbra32-e6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> So, if there a way to stop support/scripts/apply-patches.sh from
> pruning Cargo.toml.orig files, so this patch can be dropped?

Now that I think of it, adding a post-extract hook to remove the
Cargo.toml.orig entries from .cargo-checksum.json files may do 
the trick... No more big patch nor apply-patches.sh modifications.

--
ELB
