From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:46:50 +0200
Subject: [Buildroot] [PATCH 1/1] libcorrect: add package
In-Reply-To: <20181009234649.19784-1-JoelsonCarl@gmail.com>
References: <20181009234649.19784-1-JoelsonCarl@gmail.com>
Message-ID: <20181010104650.39d03535@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 17:46:49 -0600, Joel Carlson wrote:
> Adds the libcorrect package. Libcorrect by default builds a shared
> library, so require shared libraries. It also sets the -Wpedantic flag
> in its Debug build, which first exists starting in gcc 4.8.
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---

After looking quickly at it, I decided to add a patch that uses
-Wpedantic only if available, which allows to drop the dependency on
the gcc version. The patch was submitted upstream.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
