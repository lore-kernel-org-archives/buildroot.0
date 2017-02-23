From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:41:56 +0100
Subject: [Buildroot] [PATCH 1/1] glibc: install libanl.so to target
In-Reply-To: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
References: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
Message-ID: <20170223214156.5dc95fb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 12:11:10 +0100, Jesper B?kdahl wrote:
> Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>

Thanks for your contribution. However, could you extend the commit log
to explain briefly in which situations is this library used?

In addition, you should also adjust the TOOLCHAIN_EXTERNAL_LIBS
variable in toolchain/toolchain-external/pkg-toolchain-external.mk to
be consistent.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
