From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jun 2017 09:08:20 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/python-traitlets: New package
In-Reply-To: <CAHQ1cqFAjMFb6r4ys_oUrp2jR=m3g5s6QH4GaaXwqvYk3oAgCQ@mail.gmail.com>
References: <20170612234216.902-1-andrew.smirnov@gmail.com>
 <20170612234216.902-2-andrew.smirnov@gmail.com>
 <20170615231219.530631ea@windsurf.lan>
 <CAHQ1cqFAjMFb6r4ys_oUrp2jR=m3g5s6QH4GaaXwqvYk3oAgCQ@mail.gmail.com>
Message-ID: <20170616090820.4576d88d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Jun 2017 16:25:28 -0700, Andrey Smirnov wrote:

> > What about adding a test in the runtime test infrastructure that
> > verifies that ipython runs fine with both python2 and python3 ?
> 
> I am not very familiar with BR's testing infrastructure, so it will
> take me some time to figure out, but I'll give it a try and send a
> patch separately.

A good example for your test is:

  support/testing/tests/package/test_python.py

You can run it by doing:

  ./support/testing/run-tests -o output tests.package.test_python.TestPythonBase

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
