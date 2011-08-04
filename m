From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 4 Aug 2011 18:41:28 +0000 (UTC)
Subject: [Buildroot] Add description of "make xxxxxx_defconfig" to docs?
Message-ID: <j1ep4o$qq5$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found the section on saving a configuration for a specific target:

  http://buildroot.uclibc.org/downloads/buildroot.html#board_support

But nowhere does the documentation explain how to use a saved
configuration.After spending some time looking at the Makefile, I
figured out that you simply do a

  $ make  xxxxxxx_defconfig
  $ make
  
[where xxxxxxx_defconfig is the name of any of the files found in
configs/]

Perhaps that's worth a mention in the documentation?

-- 
Grant Edwards               grant.b.edwards        Yow! If I felt any more
                                  at               SOPHISTICATED I would DIE
                              gmail.com            of EMBARRASSMENT!
