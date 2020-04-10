From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 10 Apr 2020 18:12:07 +0300
Subject: [Buildroot] Why there are two colons on .stamp_built rule?
Message-ID: <CALFsTFWzzN2reVfT26bKF0qmYWOZxHJshMNpuB7HhHSXm2-_kA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was looking for something in pkg-generic.mk and then I noticed that
the rule for .stamp_built has two colons.

This is the line:
  $(BUILD_DIR)/%/.stamp_built::

Is it on purpose or it's just a simple harmless mistake? Do the two
colons even mean something?

Best regards,
Asaf.
