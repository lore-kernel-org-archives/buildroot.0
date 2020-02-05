From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 5 Feb 2020 12:47:44 +0100
Subject: [Buildroot] ninja 1.10.0: build issue
Message-ID: <CAGm1_ktqUWDo8Wjq_QEXTxx17H9UkJS0hxY869X16Fka_wz8mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a strange issue when building host-ninja. CMake complains about
wrong OBJECT library usage. This upstream PR [1] fixes the issue for
me.

CMake was also complaining about the missing re2c tool.

Am I the only one having these issues?

[1] https://github.com/ninja-build/ninja/pull/1731

Regards,
Yegor
