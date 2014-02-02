From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 22:07:02 +0100
Subject: [Buildroot] [PATCHv2] mtr: new package
In-Reply-To: <1391025824-23694-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 29 Jan 2014 17:03:44 -0300")
References: <1391025824-23694-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvo1p6kp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in     |  1 +
 >  package/mtr/Config.in |  9 +++++++++
 >  package/mtr/mtr.mk    | 24 ++++++++++++++++++++++++
 >  3 files changed, 34 insertions(+)
 >  create mode 100644 package/mtr/Config.in
 >  create mode 100644 package/mtr/mtr.mk

Committed, thanks.

 > +MTR_VERSION = 0.85
 > +MTR_SITE = ftp://ftp.bitwizard.nl/mtr
 > +MTR_CONF_OPT = --without-gtk --without-glib

It would be nice to see a followup patch adding glib / gtk support if
enabled.

-- 
Bye, Peter Korsgaard
