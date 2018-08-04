From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 18:33:02 +0200
Subject: [Buildroot] [PATCH 0/3] download: detect and refuse git branch by
 name
Message-ID: <cover.1533400367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series documents why using a branch by name is bad and is not
supoprted, and makes the git backend actually detect them and abort if
the version is a branch by name.

The series starts with a little bit of cleanup in the download wrapper.


Regards,
Yann E. MORIN.


The following changes since commit 81ea4a243b63d7bb1fec580910c553af4ae072c1

  package/lttng-tools: bump version to 2.10.5 (2018-08-01 14:28:30 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d1cdffd986d2f2128396aa785d542fdd3d2c90e0

  support/download: detect and abort when using a git branch by name (2018-08-04 18:28:36 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      support/download: remove help from wrapper
      docs/manual: expand on why using a branch name is not supported
      support/download: detect and abort when using a git branch by name

 docs/manual/adding-packages-generic.txt | 15 +++++++++--
 support/download/dl-wrapper             | 47 +--------------------------------
 support/download/git                    |  7 +++++
 3 files changed, 21 insertions(+), 48 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
