From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 13:05:26 +0200
Subject: [Buildroot] [PATCH v4 06/11] pkg-cmake.mk: globally disable
 BUILD_TESTING flag
In-Reply-To: <1401614673-3703-7-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20140601130526.08882da0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  1 Jun 2014 11:24:28 +0200, Samuel Martin wrote:
> This CMake flag is used to enable tests. It may not disable the test
> programs from being built, but it controls the test execution.
> 
> Since we don't care about building the tests (and usually disable them
> when possible), make sure Buildroot won't try to run them.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
