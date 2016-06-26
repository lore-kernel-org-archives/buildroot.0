From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:48:49 +0200
Subject: [Buildroot] 3 patches to buildroot via git send-email
In-Reply-To: <CAGrGpJD9MX_aNzwu357LziPAOMYLbHeQt=sKAukPCav2-anbog@mail.gmail.com>
References: <CAGrGpJD9MX_aNzwu357LziPAOMYLbHeQt=sKAukPCav2-anbog@mail.gmail.com>
Message-ID: <20160626144849.4b5ab2fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As I mentioned, we received 3 times the same patch, for sdl2_ttf. And
as Baruch noted, the commit title was wrong.

On Sat, 25 Jun 2016 21:20:04 -0600, Peter Thompson wrote:

> Step 2 - create 3 branches (1 per patch)

Don't do this. Create one branch only, with one commit per package.

> submit via
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
> $ git fetch --all --tags    # update with latest buildroot version
> $ git rebase origin/master    # redo my commits on latest buildroot version
> $ git format-patch -M -n -s -o outgoing origin/master #format and send it
> $ git send-email --to buildroot at buildroot.org outgoing/*

Please send the patches to you first, in order to check that they look
good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
