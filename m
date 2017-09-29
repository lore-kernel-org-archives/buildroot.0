From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 29 Sep 2017 12:34:42 +0200
Subject: [Buildroot] swig: javascript support broken for Node.js 8.5
Message-ID: <CAGm1_ktfFJLqtA1MgOQ-U+Xt8QHHvf_AJxK_3U+drWO+2qEw3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The binding files created for JavaScript won't  work with the Node.js
>= 7.x (we have Node.js 8.5.0). On swig's GitHub page there is a
related PR [1] fixing this issue. It is still unknown whether this fix
will applied, so what do you think about integrating those two
patches?

[1] https://github.com/swig/swig/pull/968

Yegor
