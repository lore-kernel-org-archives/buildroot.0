From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 11:13:53 +0200
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.7 and improve
 cross build
In-Reply-To: <1398211678-20218-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398211678-20218-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140424111353.014f1d84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Apr 2014 21:07:58 -0300, Gustavo Zacarias wrote:
> Bump to the latest 4.1.7 version and improve the cross-build logic.
> With the new patches the build is basically architecture-agnostic making
> it possible to ditch the arch-specific cache to use a generic one.
> Some toolchains might not be too happy with samba4 because of bitrot,
> hopefully we'll find and fix or blacklist those with autobuilder help.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
