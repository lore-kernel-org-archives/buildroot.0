From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 20:11:07 +0200
Subject: [Buildroot] [PATCH 0 of 4 v2 for 2014.08] manual-text generation
	improvements
Message-ID: <patchbomb.1407867067@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series makes some improvements to the generation of the text
version of the manual:
- make sure that URLs are visible
- remove the 'logo' (logo.png) reference

To achieve this, two preparatory patches are needed.

Note that this series stands on its own, it can already be applied.
A subsequent series will make structural and content-wise changes to the
manual itself.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: refine patch 3 (changing URLs)

Thomas De Schampheleire (4)
  gendoc infra: use $(pkgname) instead of explicitly passing 'manual'
  gendoc infra: add support for asciidoc configuration files
  manual-text: make sure URLs are displayed if a link text was provided
  manual-text: hide image representations

 docs/manual/asciidoc-text.conf |  23 +++++++++++++++++++++++
 docs/manual/manual.mk          |  26 ++++++++++++++++----------
 2 files changed, 39 insertions(+), 10 deletions(-)
