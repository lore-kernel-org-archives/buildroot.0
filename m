From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 19:58:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Change default
 to X.org modular server
In-Reply-To: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411195842.52a58aff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 19:13:56 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Change default for all toolchain configurations (Thomas)

Well, it's not actually changing the default for all toolchain
configurations, since the modular X.org variant requires C++ support,
while the KDrive variant does not.

However, probably this doesn't matter. On such a change, I'd like to
have a Acked-by from a few other Buildroot developers. Yann, Arnout,
Gustavo, what do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
