From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:41:05 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/openal: bump to version 1.20.1
In-Reply-To: <20200813182445.3332982-1-fontaine.fabrice@gmail.com>
References: <20200813182445.3332982-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813224105.392744f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 20:24:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix the build with gcc 10 due to the library codebase being
> switched to C++11.
> 
> It should be noted that bumping the C++ requirement from C++11 to C++14
> is not needed for this bump as this change is not yet in this version:
> https://github.com/kcat/openal-soft/commit/f6a0b004e0424e1f12a226b3b3c7193063eb02e3
> 
> Also update indentation in hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4546ce4f176164462b0e73c387bc45c9771f98f7
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Drop C++14

I've changed the author back to Andr?, since he sent the patch
originally and was still the first person in the Signed-off-by list.
And applied to master!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
