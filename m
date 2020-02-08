From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 19:58:36 +0100
Subject: [Buildroot] [PATCH] package/localedef: relax required toolchain
 version
In-Reply-To: <20200206210859.6978-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Thu, 6 Feb 2020 15:08:59 -0600")
References: <20200206210859.6978-1-matthew.weber@rockwellcollins.com>
Message-ID: <87a75svrc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The glibc package has been updating the toolchain version
 > dependency since 2.28.x. The dependencies don't currently
 > apply to the localedef build of the package, so this
 > patchset relaxes the restriction such that builds can still
 > occur on older host machines.

 > The current supported minimum versions after this patch
 > is applied are:
 > GCC 4.8
 > Binutils 2.24

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
