From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 14:46:27 +0200
Subject: [Buildroot] [PATCH v2 01/12] toolchain: specify GCC_BUG_85180
 is true only if GCC version < 8.x
In-Reply-To: <20190521133932.81841-2-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 21 May 2019 15:39:21 +0200")
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-2-giulio.benetti@micronovasrl.com>
Message-ID: <87v9xilw4c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > Bug 85180:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
 > has been fixed on Gcc version >= 8.x

 > So:
 > - add 'depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8' to 'config
 >   BR2_TOOLCHAIN_HAS_GCC_BUG_85180'.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
