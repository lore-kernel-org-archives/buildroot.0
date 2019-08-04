From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 17:25:31 +0200
Subject: [Buildroot] [buildroot-test 0/5] improve modularity by adding an
Message-ID: <20190804152536.17829-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series replace the manual argument parsing by a python
argument parser. The goal is to improve the modularity to help the
integration of new information to the mails.

Victor Huesca (5):
  utils/daily-mail: introduce argparse to ease modularity of the script
  utils/daily-mail: allow to pass a date in arguments
  utils/daily-mail: allow to specify branches from command-line
  utils/daily-mail: allow to select only a subset of emails to send
  utils/daily-mail: allow to select only a subset of data to send in
    emails

 utils/daily-mail | 64 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 17 deletions(-)

-- 
2.21.0
