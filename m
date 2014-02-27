From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Feb 2014 08:35:03 +0100
Subject: [Buildroot] [PATCH] gcc: fix xtensa overlay application
In-Reply-To: <1393477640-14319-1-git-send-email-jcmvbkbc@gmail.com>
References: <1393477640-14319-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140227083503.1c07d270@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Thu, 27 Feb 2014 09:07:20 +0400, Max Filippov wrote:
> gcc build scripts use wrong variable name to specify xtensa overlay
> application command. As a result gcc is built with the default overlay,
> which leads to obscure failures later in the build process.
> 
> xtensa toolchain needs an additional configuration for a specific core
> variant we're building for. This configuration is called 'overlay' and
> is an archive with files for binutils, gcc and gdb that replace
> corresponding files in toolchain components.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
