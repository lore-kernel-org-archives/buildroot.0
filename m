From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:55:37 +0200
Subject: [Buildroot] [PATCH v2 1/2] core/pkg-kconfig: fix .config rule
 for silent mode
In-Reply-To: <1459246302-21837-2-git-send-email-romain.izard.pro@gmail.com>
References: <1459246302-21837-1-git-send-email-romain.izard.pro@gmail.com>
 <1459246302-21837-2-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160329165537.3b2b2f0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 12:11:41 +0200, Romain Izard wrote:
> Ensure that each command line in the .config rule is prefixed by $$(Q)
> 
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> Changelog:
> v2: New patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
