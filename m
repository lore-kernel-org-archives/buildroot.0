From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 23:24:53 +0200
Subject: [Buildroot] [PATCH 3/3] cargo-bin: bump version to 0.30.0
In-Reply-To: <20181021174157.GA7056@itchy> (Eric Le Bihan's message of "Sun,
 21 Oct 2018 19:41:57 +0200")
References: <20181018205835.8719-1-eric.le.bihan.dev@free.fr>
 <20181018205835.8719-4-eric.le.bihan.dev@free.fr>
 <20181021000231.0addc2ca@windsurf.lan> <20181021174157.GA7056@itchy>
Message-ID: <87y3ar3sd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

Hi,

 >> This looks weird and suspicious. Has upstreaming modified their tarball
 >> after releasing them ? Has their server been hacked, and the tarballs
 >> replaced with some bad thing inside ?

 > Void Linux seems to have the same issue [4]. They reverted a commit
 > where the initial hash for cargo-0.30.0-i686 was
 > 4b828c263283241ad1c99f30e0b5d8554b6dac2737d09cfd466b4c15b0d7296a (just
 > like in my patch) to
 > 43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d (the
 > new one). Sames goes for x86_64.

Ahh, ok.

 > The key is listed among the official ones [5,6].

Thanks!

 > Should the new patch with proper hashes mentions something like this?

 > ```
 > # From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
 > # Verified using https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.asc
 > sha256
 > 43a5754d13fa0436b33c48b1f562b4198d6930efad3dc36284b88289ff20d74d
 > cargo-0.30.0-i686-unknown-linux-gnu.tar.xz

Looks good to me, please send a patch with that.

-- 
Bye, Peter Korsgaard
