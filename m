From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 16 Jun 2016 22:31:53 +0200
Subject: [Buildroot] [PATCH 2/2] rust: new package
In-Reply-To: <A3C625A2-C5F3-40DA-B192-73424F71B9B8@exablox.com>
References: <1461508789-17644-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1461508789-17644-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160616000933.19d72bed@free-electrons.com>
 <A3C625A2-C5F3-40DA-B192-73424F71B9B8@exablox.com>
Message-ID: <20160616223153.363fb47b@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Wed, 15 Jun 2016 15:42:13 -0700,
Charles Hardin <ckhardin@exablox.com> a ?crit :

> We are already building rust 1.9.0 derived from Eric?s patches - he
> updated them a bit ago and we modified them slightly.
> 
> I haven?t tried to post any other patches since I don?t want to
> confuse the issue with our changes on his changes on buildroot
> changes.

A new version of the patch series, with support for Rust 1.9.0, will be
posted shortly. Feel free to comment/review it when available.

> BTW - I would also really want to know what the proper method is for
> making an EXTERNAL rust toolchain option because that llvm compiles
> is at least 5 expressos long and by the time it is down - well the
> hands just jitter.

Maybe we could introduce a virtual package named "rust-toolchain". Then
there will be two packages which provides it:

- rust: build Rust from source
- rust-external: download the official pre-built release or use one
  provided by the user.

Regards,

-- 
ELB
