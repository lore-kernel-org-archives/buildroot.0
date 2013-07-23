From: Tim Nelson <tnelson@rockbochs.com>
Date: Tue, 23 Jul 2013 15:33:28 -0500 (CDT)
Subject: [Buildroot] Recommended cross toolchain for ARM
In-Reply-To: <20130723060305.GA6169@zuhnb712.ap.bm.net>
Message-ID: <4149687.113980.1374611608786.JavaMail.root@rockbochs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message -----
> Hi,
> 
> Do you guys have a suggested cross toolchain?  I want to use glibc
> instead of uclibc, so in the buildroot default supported options, it
> left only Sourcery CodeBench (SCB).  But SCB seems not a very
> completed
> toolchain, when I use it to compile some of my applications, I found
> it
> missed with some definitions (such as RLIM_*) which should normally
> appear in a standard header file.
> 
> Then I tried, Linaro, but it seems that it do not well support my
> armv5t
> core. Anyway, I run with errors after configured it with buildroot.
> 
> So, is there a free ARM cross toolchains which is in one hand
> workable
> with buidroot and on the other hand contains all the necessary things
> that normally required to build applications.
> 
> Thanks in advance!
> 

I've had good luck with building my own using crosstool-ng[1].

--Tim

[1] http://crosstool-ng.org/
