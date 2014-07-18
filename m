From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 18 Jul 2014 08:48:50 -0400
Subject: [Buildroot] Replace libev with libuv
Message-ID: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuv supercedes libev in many ways, adds more features, and is
regularly updated. libev has not been updated for more than a year
now. libuv uses autogen.sh which is tricky to get working properly in
Buildroot so I request the higher authorities to add this as it is
perhaps the most useful asynchronous I/O library in C. Current
unstable version is 0.11.26 and stable is 0.10.27. Thank you.
