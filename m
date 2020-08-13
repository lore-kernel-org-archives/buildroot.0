From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu, 13 Aug 2020 10:15:40 +0200
Subject: [Buildroot] [package/rust-bump to version 1.45.2 0/2]
Message-ID: <1597306542-12234-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rust evolved a lot since version 1.40.0, stabilized many
APIs and fixing various BUGS.
A detailed list of changes is available at :
https://github.com/rust-lang/rust/blob/master/RELEASES.md.

Remark : APPENDIX (entitled : how to apply the Apache License to your work)
	 has been removed from the end of LICENSE-APACHE.

Jugurtha BELKALEM (2):
  package/rust: bump to version 1.45.2
  package/rust-bin: bump to version 1.45.2

 package/rust-bin/rust-bin.hash | 92 +++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |  2 +-
 package/rust/rust.hash         |  8 ++--
 package/rust/rust.mk           |  2 +-
 4 files changed, 52 insertions(+), 52 deletions(-)

-- 
2.7.4
