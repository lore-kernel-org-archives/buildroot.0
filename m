From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:38:03 +0100
Subject: [Buildroot] [PATCH 1/1] mono: Remove out of date configure
 options.
In-Reply-To: <20170315015507.6512-1-dustin.r.johnson@gmail.com>
References: <20170315015507.6512-1-dustin.r.johnson@gmail.com>
Message-ID: <20170318153803.5b078e71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 21:55:07 -0400, Dustin Johnson wrote:
> The makefile for the mono package contains out of date configuration options. The --disable-gtk-doc option is no longer available in configure. Moonlight is no longer supported in Mono and the --with-moonlight=no option is no longer required.

Commit log messages should be wrapped at 72 characters, so I've fixed
that up.

> 
> Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
> ---
>  package/mono/mono.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
