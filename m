From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 14 Jul 2015 11:59:04 +0200
Subject: [Buildroot] [PATCH] package/mono-gtksharp3: new package
In-Reply-To: <20150714115218.25acce3f@free-electrons.com>
References: <1425562382-9625-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150714115218.25acce3f@free-electrons.com>
Message-ID: <CA+TH9VmgVKWP+ysNkuXTjgg3EsNnukQnE0VRg3zQNgm7YAbVog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,


2015-07-14 11:52 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Thu,  5 Mar 2015 14:33:02 +0100, Angelo Compagnucci wrote:
>> This patch adds gtksharp3 package for mono.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> The patch looks good, but it unfortunately doesn't build here:
>
> checking for gmcs... no
> configure: error: No C# compiler found. You need to install either mono (>=2.8) or .Net
> package/pkg-generic.mk:146: recipe for target '/home/thomas/buildroot/output/build/mono-gtksharp3-2.99.3/.stamp_configured' failed
> make: *** [/home/thomas/buildroot/output/build/mono-gtksharp3-2.99.3/.stamp_configured] Error 1

Several mono version has changed in the meantime, so I think this
patch should be updated. I'll look at this asap.

Sincerely, Angelo

>
> I'm building the following defconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-496-g85945aa.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_MONO=y
> BR2_PACKAGE_MONO_GTKSHARP3=y
> BR2_PACKAGE_LIBGTK3=y
>
> Can you have a look? In the mean time, I'll mark the patch as Changes
> Requested in patchwork, so can you resend a new version after fixing
> this problem? Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
