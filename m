From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  5 Feb 2013 16:34:31 +0100
Subject: [Buildroot] [pull request] Pull request for branch arnout-legacy
Message-ID: <cover.1360078421.git.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Hello,

Two patches to clean up the legacy config menu, as discussed in the BR
developer day.

The following changes since commit ddd69b5609cc9bd954afcfc2f91831d64b9cfff7:

  libffi: switch to using a Git version, brings Microblaze and Xtensa support (2013-02-05 15:57:02 +0100)

are available in the git repository at:

  https://git.gitorious.org/buildroot/buildroot.git arnout-legacy

for you to fetch changes up to a5670953b17e7bbae7daf2ae2a98fdc43d53d8ad:

  Legacy: order the options reverse-chronologically. (2013-02-05 16:03:35 +0100)

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (2):
      Legacy: make the menu a normal menu.
      Legacy: order the options reverse-chronologically.

 Config.in.legacy |   78 ++++++++++++++++++++++++++++--------------------------
 1 file changed, 40 insertions(+), 38 deletions(-)
--
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
