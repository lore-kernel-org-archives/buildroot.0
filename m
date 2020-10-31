From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:21:44 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libabseil-cpp: enforce C++11
In-Reply-To: <20201030112506.489-1-buildroot@heine.tech>
References: <20201030112506.489-1-buildroot@heine.tech>
Message-ID: <20201031222144.6409094c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Oct 2020 12:25:04 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Abseil needs at least c++11 but removed the fallback when not set in [0].
> So we need to do this.
> 
> [0] https://github.com/abseil/abseil-cpp/commit/c6954897f7ece5011f0126db9117361dc1a6ff36
> 
> Fixes:
>   http://autobuild.buildroot.net/results/5780d5e21e5e9c0ba86cc422ef995f45dc83cc4c
>   http://autobuild.buildroot.net/results/8138c63fc13940e1b97f07f24752b199f88ccfa8
>   http://autobuild.buildroot.net/results/f8eda966c6400c242680db378c8944444d89d5c5
>   http://autobuild.buildroot.net/results/38e9427d995e16bc4876f9fdc890c42e4fd04c06
>   http://autobuild.buildroot.net/results/4e99415728a6f3c6b396a9872924262652f77996
>   http://autobuild.buildroot.net/results/1830577843772bdfd6e310b4d361aa1edf5969d6
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/libabseil-cpp/libabseil-cpp.mk | 2 ++
>  1 file changed, 2 insertions(+)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
