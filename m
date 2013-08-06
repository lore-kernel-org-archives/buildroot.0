From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  6 Aug 2013 23:36:19 +0200
Subject: [Buildroot] [PATCH 0/5] Manual updates
Message-ID: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a small patch series about the manual integrating the following
patches for patchwork:
- http://patchwork.ozlabs.org/patch/214943/
- http://patchwork.ozlabs.org/patch/216485/
- http://patchwork.ozlabs.org/patch/232024/

I had to rework some of them to get them cleanly merged the git tree,
the most noticeable thing is the split patch 214943.

Regards,


Samuel

--

A.R.D (2):
  manual: update beyond Buildroot section
  manual: add tips to build manual

Samuel Martin (1):
  manual: minor formating fixes

Stephan Hoffmann (1):
  Docu: Add LIBFOO_EXTRACT_CMDS

Vinicius Tinti (1):
  manual: add patch revision and versioning section

 docs/manual/adding-packages-generic.txt |  18 +++-
 docs/manual/beyond-buildroot.txt        | 162 +++++++++++++++++++++++++++++---
 docs/manual/contribute.txt              |  66 +++++++++++++
 docs/manual/make-tips.txt               |  20 +++-
 docs/manual/using.txt                   |   3 +-
 docs/manual/working-with.txt            |   5 +
 6 files changed, 254 insertions(+), 20 deletions(-)

--
1.8.3.4
