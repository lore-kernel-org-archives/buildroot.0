From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2019 21:45:01 +0100
Subject: [Buildroot] [PATCH 0/2] gitlab-ci: update base image (branch
 yem/docker-base)
Message-ID: <cover.1572209096.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes and updates our gitlab-ci.yml to use our latest and
updated base docker image.


Regards,
Yann E. MORIN.


The following changes since commit c00edee402ac741bd30bee669b0c997415f35be9

  package/ngrep: relace '_' by '.' in version (2019-10-27 21:35:06 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c9d92f6f985ac61252d6d2551650b11d9a159c8b

  gitlab-ci: use our updated docker base image (2019-10-27 21:42:05 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      gitlab-ci: regenerate after new defconfig addition
      gitlab-ci: use our updated docker base image

 .gitlab-ci.yml    | 3 ++-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
