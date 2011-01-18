From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:30 -0300
Subject: [Buildroot] [PATCH 00/10] Add mpd to buildroot
Message-ID: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds the mpd package to buildroot.

No attempt is made to avoid people hurting themselves, for instance
you can build mpd with a full set of options even on a softfloat target
though it probably won't do you any good if you lack the CPU power for
some codecs like wavpack.

Run-tested on powerpc hardfloat.
Build-tested for armv4t softfloat.
