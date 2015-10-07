From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Wed, 7 Oct 2015 11:52:57 -0600
Subject: [Buildroot] add a new package: PyQtGraph
Message-ID: <1444240379-22896-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

PyQtGraph is based on the PyQt framework, it is an easy to use 
library to build advanced, science related, plots/user interfaces.

It is easy to build since it is only made of Python scripts.

It depends on Python-Numpy which required a GLIBC toolchain
by the time I created a patch (10/05/2015) but that might
have changed in the mean-time.

I guess i met your requirements for 'selects/depends on',
check this out and enjoy it.
