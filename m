From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 17:21:07 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/rpm: don't set openmp
In-Reply-To: <20201203173710.540004-1-fontaine.fabrice@gmail.com>
References: <20201203173710.540004-1-fontaine.fabrice@gmail.com>
Message-ID: <20210102172107.02576bb8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Dec 2020 18:37:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Don't set openmp to fix a build failure with codesourcery toolchain that
> doesn't have OpenMP >= 4.5 indeed upstream doesn't want to remove the
> build failure if the user provides --enable-openmp and OpenMP is < 4.5:
> https://github.com/rpm-software-management/rpm/pull/1433
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/05dd945d24e8684aad6a2343ba7f6f8a7cea8349
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Don't set openmp instead of disabling it

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
