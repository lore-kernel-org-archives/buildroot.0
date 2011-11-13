From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:54:42 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/doc-updates
Message-ID: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A few documentation updates that should go in 2011.11. It's far from
complete, but it's better to have this rather than nothing.

Thomas

The following changes since commit 296eb11299d1240b3570aba5abb8374a0911bf44:

  pulseaudio: needs host-intltool (2011-10-29 16:35:47 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/doc-updates

Thomas Petazzoni (5):
      doc: suggest how to add suboptions
      doc: mention how to format the Config.in file
      doc: more details about expressing dependencies in Config.in
      doc: mention the CMAKETARGETS infrastructure in the list of infrastructures
      doc: update GENTARGETS/AUTOTARGETS/CMAKETARGETS on the number of arguments

 docs/manual/adding-packages-autotargets.txt  |    2 +-
 docs/manual/adding-packages-cmaketargets.txt |    2 +-
 docs/manual/adding-packages-directory.txt    |   70 +++++++++++++++++++++++--
 docs/manual/adding-packages-gentargets.txt   |   29 +++--------
 4 files changed, 74 insertions(+), 29 deletions(-)

Thanks,
-- 
Thomas Petazzoni
