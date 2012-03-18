From: Samuel MARTIN <s.martin49@gmail.com>
Date: Sun, 18 Mar 2012 09:53:58 +0100
Subject: [Buildroot] [PATCH 0/5] Docs: Misc. updates and trivial fixes
Message-ID: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Among miscellaneous fixes in the documentation, this patch series does:
- add a warning on the current about the deprecation of the html doc.
- complete some sections in the manual.

Samuel MARTIN (5):
  docs/buildroot.html: cleanup trailing whitespaces
  docs/buildroot.html: add new manual location and warning about this
    page
  docs: fix busybox url
  manual: fix typo
  manual: update Config.in dependency explainations

 docs/buildroot.html                         |   41 +++++++++++++++++---------
 docs/manual/adding-packages-directory.txt   |   42 ++++++++++++++++++++++++++-
 docs/manual/adding-packages-handwritten.txt |   14 ++++-----
 docs/manual/using.txt                       |    2 +-
 4 files changed, 77 insertions(+), 22 deletions(-)

--
1.7.9.4
