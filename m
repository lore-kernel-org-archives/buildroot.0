From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Mar 2013 08:41:57 +0100
Subject: [Buildroot] [PATCH] pkg-autotools.mk: remove extra space from
 config-update message
In-Reply-To: <1363053511-9208-1-git-send-email-danomimanchego123@gmail.com>
References: <1363053511-9208-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20130312084157.4528e185@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon, 11 Mar 2013 21:58:31 -0400, Danomi Manchego wrote:
> If you do a "make -s", you will notice that the UPDATE_CONFIG_HOOK message
> has an extra space compared to other highlighted messages. ?For example:
> 
> >>> util-linux 2.20.1 ?Updating config.sub and config.guess
> >>> util-linux 2.20.1 Patching libtool
> >>> util-linux 2.20.1 Autoreconfiguring
> 
> A grep shows this is the only instance of the extra space. This patch
> removes the extra space.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
