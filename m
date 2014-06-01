From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 14:28:22 +0200
Subject: [Buildroot] [PATCH] ncurses: enable parallel build
In-Reply-To: <1401307959-19956-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401307959-19956-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140601142822.245373e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 28 May 2014 17:12:39 -0300, Gustavo Zacarias wrote:
> Using a trick taken from gentoo enable parallel build when building for
> the target to reduce the build time for my test case from about 54s to
> 32s on a dual-core laptop.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Without the patch:

real	0m29.326s
user	0m23.549s
sys	0m8.617s

With the patch:

real	0m18.839s
user	0m40.948s
sys	0m10.707s

A reduction of 11 seconds of the real build time, on a quad-core i7
laptop.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
