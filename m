From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 19 Jul 2012 15:01:17 -0400
Subject: [Buildroot] [PATCH 0/1] Makefile: add variable print capabilities
Message-ID: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I just got started with buildroot yesterday, and like it :-).
I am no Makefile expert, then often I turn into wanting to check Makefile variables.
This patch adds a capability to do so by issuing:

$ make print-<myvariable>

e.g.

$ make print-DL_DIR
DL_DIR = /home/evigier/buildroot/dl

The implementation is perhaps clumsy, I am open to advices.
Thanks, keep on the good work.

Emeric
