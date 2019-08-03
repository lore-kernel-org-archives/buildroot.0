From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 14:52:49 +0200
Subject: [Buildroot] [PATCH 4/4] support/testing: test atop with builtin
 kernel
In-Reply-To: <20190803052216.22292-5-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sat, 3 Aug 2019 02:22:16 -0300")
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
 <20190803052216.22292-5-ricardo.martincoski@gmail.com>
Message-ID: <87mugqcswu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Use the new builtin kernel 4.19 to test atop.
 > The atop package cannot be tested using BASIC_TOOLCHAIN_CONFIG because
 > it needs kernel headers >= 3.14. So use an updated version of it,
 > copying the config fragment from
 > support/config-fragments/autobuild/br-arm-full.config

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
