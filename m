From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Mar 2018 21:35:04 +0100
Subject: [Buildroot] [PATCH 0/2] core/instrumentation: optimisations
Message-ID: <cover.1521146096.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings in two optimisations to the instrumentation steps.
The first is very minor (but still), while the second is the most
important one. See the commit log for the whole explanations.


Regards,
Yann E. MORIN.


The following changes since commit dbeb43e97626df988534b9cf62b5618b0b6ccfa1

  package/busybox: Unbreak the `tar` implementation (2018-03-14 20:15:22 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 6a793a6dba4f052ca8bbc35edd63df601f46478b

  core/instrumentation: shave minutes off the build time (2018-03-15 21:21:36 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      core/intrumetnation: don't spawn to get seconds-since-EPOCH
      core/instrumentation: shave minutes off the build time

 package/pkg-generic.mk | 51 ++++++++++++--------------------------------------
 1 file changed, 12 insertions(+), 39 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
