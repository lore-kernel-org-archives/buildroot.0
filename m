From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:22:01 +0100
Subject: [Buildroot] [PATCH 1/2] qt5script: Disable on non-supported
 platforms
In-Reply-To: <1385654237-36389-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
 <1385654237-36389-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131226232201.2ec1890a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 28 Nov 2013 15:57:16 +0000, Vicente Olivert Riera wrote:
> Is the same problem as Qt4 QtScript, it doesn't build because it uses
> JavaScriptCore, so we re-use the existing
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT option which already lists which
> platforms are supported by JavaScriptCore.
> 
> This is a quick fix. A proposed fix to add support for MIPS64 has
> already been sent to Qt:
> 
>    https://bugreports.qt-project.org/browse/QTBUG-35191
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/231/231c112a3fc18e6cd7d6d10873e22144525c7280/

What is the status of this patch, and the "[PATCH 2/2] qt5quick1:
Disable on non-supported platforms" patch that you sent?

Are they still needed? If so, then it should use a QT5 specific Kconfig
symbol.

Let me know what to do with these patches, so that I can updated their
patchwork status.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
