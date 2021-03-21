From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 20:34:55 +0100
Subject: [Buildroot] [PATCH] package/libgeos: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210307175214.3980194-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 7 Mar 2021 18:52:14 +0100")
References: <20210307175214.3980194-1-giulio.benetti@benettiengineering.com>
Message-ID: <87tup4pag0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > This package is affected from binutils bug 21464, since there is no
 > workaround, let's disable it.

 > Fixes:
 > http://autobuild.buildroot.net/results/3eb/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > This patch must be applied after this patchset:
 > https://patchwork.ozlabs.org/project/buildroot/list/?series=232409

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
