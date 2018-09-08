From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:47:20 +0200
Subject: [Buildroot] [PATCH/next v2] flatcc: conditionally require c++
 in cmake
In-Reply-To: <1536268289-23275-1-git-send-email-JoelsonCarl@gmail.com>
References: <1536268289-23275-1-git-send-email-JoelsonCarl@gmail.com>
Message-ID: <20180908154720.2fb09991@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 15:11:29 -0600, Joel Carlson wrote:
> Patches CMake files in flatcc to conditionally set c++ as a required
> language depending on if FLATCC_TEST option is set, as only the tests
> include a c++ file.
> 
> Fixes
> http://autobuild.buildroot.net/results/8fb0447eed1d55b7687f657530e31695cf77ce5c/
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
> Changes v1 -> v2:
>   - patch CMake files to not require C++ when we don't build the tests,
>     instead of making flatcc package require C++

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
