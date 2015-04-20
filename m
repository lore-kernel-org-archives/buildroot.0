From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:58:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/dhcpcd: Fix ipv6-related build
 error
In-Reply-To: <1429456975-17889-2-git-send-email-bernd.kuhls@t-online.de>
References: <1429456975-17889-1-git-send-email-bernd.kuhls@t-online.de>
 <1429456975-17889-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150420225837.02ddde6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Apr 2015 17:22:55 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/5ff/5ffd15ab4b866e8c0187667ace305202514bdab9/
> http://autobuild.buildroot.net/results/a58/a583eea465a7bae8969665c76c695a6b394ce7fd/
> http://autobuild.buildroot.net/results/98b/98b5aa1a8fa664e8e977ccb8a49d9906d633c057/
> http://autobuild.buildroot.net/results/dc1/dc12251f206672840347c36f5347fcba86e2c874/
> http://autobuild.buildroot.net/results/0e1/0e15f71d6992b68df57baa69b034b4001aca7a21/
> http://autobuild.buildroot.net/results/e00/e0093101ae636a693744c040710e68a90d1e6aa1/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Do you have an explanation of why this build failure happens with
certain uClibc toolchains and not others?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
