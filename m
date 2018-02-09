From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Feb 2018 09:44:26 +0100
Subject: [Buildroot] [next] listing of tests is broken
Message-ID: <CAGm1_kvtXtxu_YjCeXNOUr706hJp-nwrX77QOD9m9B7e3t6ftg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

./support/testing/run-tests -l

  File "/home/user/br_test/support/testing/infra/basetest.py", line
45, in __init__
    self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
TypeError: unsupported operand type(s) for +=: 'NoneType' and 'str'

Any idea?

Yegor
