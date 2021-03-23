From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Tue, 23 Mar 2021 16:57:13 +0200
Subject: [Buildroot] Buildroot - make again - wants to reapply a patch
Message-ID: <CAPm8-H4CryCNWboC-UXm=iED+a+H1K0RQ7knUpEq_KwZ0gbz_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot community,

  I am looking for an answer which I hope it will save a lot of time for me.

  At time moment t0, I have successfully built buildroot for rpi0w.
At time moment t1, I have made some configuration changes (new additions only),
and when I want to build (preferably only the changes), I get the error [1].
Does anybody know how to avoid such errors?
Why does buildroot try to reapply the patch?

Thanks a lot,
L-C

[1]
$ make
>>> host-util-linux 2.33 Patching

Applying 0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch using patch:
Error: duplicate filename
'0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch'
Conflicting files are:
  already applied:
/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.02.rpi/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
  to be applied  :
/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.02.rpi/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
