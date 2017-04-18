From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 08:59:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-17
In-Reply-To: <df818f20-0fb5-fbc6-010f-e1e5b88781e3@flatmax.org>
References: <20170418062813.5B12E2084B@mail.free-electrons.com>
 <df818f20-0fb5-fbc6-010f-e1e5b88781e3@flatmax.org>
Message-ID: <20170418085950.40987b07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Apr 2017 16:48:57 +1000, Matt Flax wrote:

> An idea to improve this build statistics processes would be to include 
> attempted executions of at least one binary in each package - where 
> appropriate.
> 
> This would catch a large number of uclibc aarch64 g++ problems (I think).

This is not possible with the current infrastructure: we don't do
runtime testing at all with this autobuild.b.o thing.

However, there is a pending patch series adding a runtime test
infrastructure, which builds and boots test cases under Qemu. This
would definitely allow testing things like this AArch64 C++ issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
