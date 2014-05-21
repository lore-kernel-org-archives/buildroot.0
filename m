From: oli vogt <oli.vogt.pub01@gmail.com>
Date: Wed, 21 May 2014 20:23:00 +1200
Subject: [Buildroot] [PATCH 1/3] python: new module flup
Message-ID: <CAAwwcmTihumuK=NCx3MQX3P1GuSM5OGMQ8UKhPCkW9fXpwnonw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas.

Thank you for your feed back.


- No I did not test with python-3. flup has not been touched since
2011-04-05 and I don't think it is supported but I could be wrong.
  In <https://pypi.python.org/pypi/flup/1.0.3.dev-20110405> there are .egg
files for 2.5, 2.6 and 2.7.

- I had a bit of a read about the licensing-support concept of Buildroot
and came up with the following:
  There is no COPYING or other license file in the project.
  The PKG-INFO file mentions BSD and. "greping" the project for 'license'
returns a source file licensed under the MIT licence so I suggest:

  PYTHON_FLUP_LICENSE = BSD-4c, MIT

  PYTHON_FLUP_LICENSE_FILES should be absent. (PKG-INFO is not really the
licence)

If this is OK I will re-submit a patch.


Thank's for your patience, I'm still new to Buildroot and Git.


Kind regards, oli
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140521/31770424/attachment.html>
