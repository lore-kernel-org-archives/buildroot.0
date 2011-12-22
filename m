From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 22 Dec 2011 13:08:30 +0100
Subject: [Buildroot] [PATCH v4 0/5] Python related changes
Message-ID: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. add infrastructure to external python packages
2. enable zlib support for host-python due to setuptools and others dependencies
3. add some external packages

FIXME: python-netifaces crosscompilation. I'll comment later on the patch.

ChangeLog: integrate all patches in one serie. Remove dpkt patch as zlib is enabled by default
