From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:55:22 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tor: new package
In-Reply-To: <1429552297-17761-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429552297-17761-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425165522.2e523bc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 20 Apr 2015 19:51:37 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: bump to version 0.2.5.12

Applied after doing some small changes:

    [Thomas:
      - remove reference to BR2_LARGEFILE, this option has been
        removed. Largefile support is now guaranteed to be present.
      - rewrap Config.in help text to the appropriate length.]

Also, if you have some time, could you:

 * Send your tor patch upstream

 * Adjust tor.mk to install the tor systemd service file that is
   available in contrib/dist/tor.service

 * Add a sysv startup script to start tor

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
