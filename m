From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:08:21 +0200
Subject: [Buildroot] [PATCH] qt: build using old C++ standart
In-Reply-To: <1471623523-23829-1-git-send-email-vzakhar@synopsys.com>
References: <1471623523-23829-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160819230821.03eca89d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 19:18:43 +0300, Vlad Zakharov wrote:
> 'std::auto_ptr' is deprecated with gcc-6 but is used in qt4 code.
> So we have to build using old C++ standart to prevent build failures.

Nit: we say "standard" and not "standart" in english. I've fixed that
up, and applied your patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
