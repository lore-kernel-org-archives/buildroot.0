From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 10:12:30 +0200
Subject: [Buildroot] [PATCH 0/8] core/show-info: export extra information
 about the package build (branch yem/show-info-extras)
Message-ID: <cover.1586592741.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

People (and scripts) who want to report on the build progress will need
ato peek inside the internal details of the package build steps, so we
expose this extra information in show-info.

Suggested-by: eeppeliteloop at gmail.com


Regards,
Yann E. MORIN.


The following changes since commit 91238c2605babd1a3d262bacdf04e14d39e59810

  package/uftp: bump to version 4.10.2 (2020-04-11 10:07:02 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0493cfafbdc9dd03d461d8707de2358156f9ad5d

  core/show-info: report image name of filesystems (2020-04-11 10:10:18 +0200)


----------------------------------------------------------------
Yann E. MORIN (8):
      core/show-info: do not show install types for host packages
      infra/pkg-generic: don't set INSTALL_{TARGET,STAGING,IMAGES} for host
      core/show-info: report install types for virtual packages too
      core/show-info: report the package build directory
      core/show-info: report whether a package is overriden
      core/show-info: report package stamp files
      core/show-info: report the ordered list of build steps
      core/show-info: report image name of filesystems

 package/pkg-generic.mk |  7 +++----
 package/pkg-utils.mk   | 52 +++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
