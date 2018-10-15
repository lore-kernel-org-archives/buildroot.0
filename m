From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 15 Oct 2018 18:47:27 +0200
Subject: [Buildroot] Update the current date using ntp.
Message-ID: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm using ntp from buildroot 2018.02.5 in a Rapberry Pi 3B+ HW
platform. These are the packages selected from: Target packages ->
Networking applications

ntp
ntpd
ntpdate

The problem is that ntpd takes around 300 seconds to update the
current date. Is there any way to speed up this process? I have to
wait until the date is updated before doing my tasks and it is very
annoying to wait around 300 seconds.

Best regards.

Oscar Gomez Fuente
TST Sistemas
www.tst-sistemas.es
