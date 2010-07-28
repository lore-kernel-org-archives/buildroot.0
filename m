From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 12:15:06 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	deprecate-gtk-on-dfb
Message-ID: <cover.1280312079.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As we discussed, here is the commit that deprecates Gtk on
DirectFB. This should probably be noted in the CHANGES file as well.

Thomas

The following changes since commit d47c73ee9ba3ab9a5f6a113047e3a4aae1afd278:
  Paul Jones (1):
        zlib: Bump to 1.2.5

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot deprecate-gtk-on-dfb

Thomas Petazzoni (1):
      libgtk2: mark DirectFB backend as deprecated

 package/libgtk2/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
