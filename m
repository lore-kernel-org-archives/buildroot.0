From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:26:40 +0100
Subject: [Buildroot] [PATCH v2] selinux-python: add patch to make the
 build process more standard
In-Reply-To: <20180117141306.15170-1-marcus.folkesson@gmail.com>
References: <20180117141306.15170-1-marcus.folkesson@gmail.com>
Message-ID: <20180117222640.07df6d2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 15:13:06 +0100, Marcus Folkesson wrote:
> Patch the Makefiles to make PREFIX and DESTDIR follow standard
> semantics to get rid of DESTDIR during compile time in
> selinux-python.mk.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
