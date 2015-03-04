From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 19:43:14 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain/buildroot: default to glibc
 where possible/convenient
In-Reply-To: <1425418520-23282-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425418520-23282-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150304194314.23d4f247@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Mar 2015 18:35:19 -0300, Gustavo Zacarias wrote:
> Default to glibc over eglibc where it's possible and/or convenient.
> Since the eglibc project is basically gone and merged with glibc it
> doesn't make sense to keep defaulting to it for architectures that
> aren't uClibc-capable.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
