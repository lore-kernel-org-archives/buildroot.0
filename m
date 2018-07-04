From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 4 Jul 2018 09:01:18 +0200
Subject: [Buildroot] Warnings with GCC 7
Message-ID: <db2fe3f5-e316-0702-4887-04b0d71fa6ad@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo,

for my build of my "x86_64" Buildroot BSP I switched the GCC version from
6 to 7. Since then I get a lot of the following warning messages:

Warning: host file "./lib/gcc/x86_64-buildroot-linux-gnu/7.3.0/plugin/include/gensupport.h" is touched by more than one package: [u'host-gcc-initial', u'host-gcc-final']

Is it something serious? Am I doing something wrong?
I use Buildroot version 2018.02.3.

Thanks,

Wolfgang.
