From: bsuarez at free.fr <bsuarez@free.fr>
Date: Mon, 15 Oct 2012 14:17:20 +0200 (CEST)
Subject: [Buildroot] rrdtool and python binding
In-Reply-To: <307253483.303942928.1350303101131.JavaMail.root@zimbra75-e12.priv.proxad.net>
Message-ID: <1953630800.303959304.1350303440745.JavaMail.root@zimbra75-e12.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I try to build rrdtool and rrdtoolmodule with python but I have some problem.

I remove the --disable-python  in rrdtool.mk but is not sufficient

The compilation work well, but when I import rrdtool in a python script I have this error :

python: '/usr/lib/python2.7/site-packages/rrdtoolmodule.so' is not an ELF executable for ARM


Buildroot version : 2012.02

Thanks

Bruno
