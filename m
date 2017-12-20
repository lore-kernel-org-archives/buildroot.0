From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Dec 2017 22:27:38 +0100
Subject: [Buildroot] [PATCH 0/2] fs/iso9660: add transparent compression
Message-ID: <cover.1513805241.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series introduces support for generating iso9660 images
with compressed files in them, using transparent (de)compression.


Regards,
Yann E. MORIN.


The following changes since commit 5b85c6a038cc210355d8d5715cdf6fa73d18e8ac

  pulseaudio: fix libsamplerate dependency (2017-12-20 21:37:18 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d9148095910e211f1b38a85f93a10ab88fa1af04

  core/tests: add test for compressed iso9660 (2017-12-20 22:12:23 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      fs/iso9660: add option for transparent (de)compression
      core/tests: add test for compressed iso9660

 .gitlab-ci.yml                           |  2 ++
 fs/iso9660/Config.in                     |  9 +++++++
 fs/iso9660/iso9660.mk                    | 12 ++++++++++
 support/testing/tests/fs/test_iso9660.py | 41 ++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
