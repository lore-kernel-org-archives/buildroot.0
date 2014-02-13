From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 23:36:25 +0100
Subject: [Buildroot] Buildroot 2014.02-rc1 released
In-Reply-To: <87sirpvn7f.fsf@dell.be.48ers.dk>
References: <87sirpvn7f.fsf@dell.be.48ers.dk>
Message-ID: <20140213233625.0515088b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 11 Feb 2014 13:38:28 +0100, Peter Korsgaard wrote:

> Of noteworthy new features we have:
> 
>  - Support for external packages/defconfigs (BR2_EXTERNAL). See user
>    manual for details.
> 
>  - Cleanup of environment variable names for consistency. The download
>    directory location override (BUILDROOT_DL_DIR) is now called
>    BR2_DL_DIR. Likewise the name of the current .config is renamed from
>    BUILDROOT_CONFIG to BR2_CONFIG. Please update your post build scripts
>    if you use this!
> 
>  - Toolchains: uClibc pread/pwrite fixes, GCC stack corruption on ARM
>    fix, updated Linaro and Sourcery Codebench external toolchains.
>    Internal toolchain support for Microblaze.
> 
>  - Python package infrastructure support. See user manual for details.

I believe another very important feature is also the Luarocks package
infrastructure. You're mentioning luarocks amongst the new package
below, but I believe it would be good to highlight the fact that
luarocks is not just a new package: it is a whole new package
infrastructure that makes it easier to add Lua packages in Buildroot.
Maybe something to be added in the final release e-mail :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
