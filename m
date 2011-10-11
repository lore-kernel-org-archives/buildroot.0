From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2011 16:38:55 +0200
Subject: [Buildroot] [RFC] Making clear that Buildroot is no longer uClibc
	specific
Message-ID: <cover.1318343868.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Historically, the Buildroot project was started by uClibc
developers. Nowadays, Buildroot can be used regardless of the choice
of C library, but many people still think it's an uClibc-only
solution.

Therefore, the following patch proposed to switch to a dedicated
#buildroot IRC channel instead of #uclibc.

In addition to that, it'd be great if the mailing-list had
buildroot at buildroot.org as its official address, and if the bug
tracker had http://bugs.buildroot.org as its official address.

What do you think?

Regards,

Thomas

The following changes since commit bde4564fa74cc25a088aa4173709894d2acf5844:

  radvd: show it in config menu when toolchain lacks ipv6 (2011-10-11 16:10:30 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/irc-change

Thomas Petazzoni (1):
      docs: change official IRC channel to #buildroot

 docs/docs.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Thanks,
-- 
Thomas Petazzoni
