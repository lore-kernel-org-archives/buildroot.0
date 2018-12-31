From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:47:35 +0100
Subject: [Buildroot] [PATCH] support/dependencies: require at least
 CMake 3.8
In-Reply-To: <20181231164454.GA26917@scaer>
References: <20181231162638.13606-1-thomas.petazzoni@bootlin.com>
 <20181231164454.GA26917@scaer>
Message-ID: <20181231174735.70dd53b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Dec 2018 17:44:54 +0100, Yann E. MORIN wrote:

> On 2018-12-31 17:26 +0100, Thomas Petazzoni spake thusly:
> > The json-for-modern-cpp package unfortunately now requires CMake >=
> > 3.8, so we need to bump our requirement from 3.1 to 3.8. If the host
> > doesn't have a CMake >= 3.8, Buildroot will build its own host-cmake
> > package.  
> 
> The upstream commit that bumped the requirement to cmake 3.8 states:
> 
>     Using target_compile_features to specify C++ 11 standard
>     https://github.com/nlohmann/json/commit/73cc5089e33ea950b6677e19ee7ec656c9bcf985
> 
> However, target_compile_features has been available even since 3.1 at
> least:
> 
>     https://cmake.org/cmake/help/v3.1/command/target_compile_features.html
> 
> I'll kick-start a build with a patched json-for-modern-cpp, to see if we
> can stay on 3.1.

Thanks! It would be a lot nicer! Do you have a CMake 3.1 installation
readily available ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
