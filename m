From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 20:40:54 +0100
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <20171030163121.939-1-norbert.lange@andritz.com>
References: <20171030163121.939-1-norbert.lange@andritz.com>
Message-ID: <20171030204054.723cdc99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 17:31:21 +0100, Norbert Lange wrote:
> The build of doc/examples/cmake-multiple-shared-libraries
> does fail as a dependend library is missing.
> This issue is not specific to builroot and should ideally
> be fixed upstream (Issue: https://bugs.lttng.org/issues/1132)
> 
> The fix is done without any indepth knowledge of the CMake
> mechanisms, but seems to work correctly
> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>

Which specific build problem are you fixing? Is this a problem that has
been found by http://autobuild.buildroot.org? If that's the case, we
like to include a reference to such an autobuilder failure in the
commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
