From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:26:18 +0100
Subject: [Buildroot] [PATCH v2 2/2] miraclecast: new package
In-Reply-To: <1428271811-27530-2-git-send-email-ryanbarnett3@gmail.com>
References: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
 <1428271811-27530-2-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20151130232618.46149587@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Sun,  5 Apr 2015 17:10:11 -0500, Ryan Barnett wrote:
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> CC: Baruch Siach <baruch@tkos.co.il>
> CC: Yann E. MORIN <yann.morin.1998@free.fr>

Guess what? A miracle happened for miraclecast: it was just merged in
Buildroot's next branch!

I just did a few minor fixups:

    [Thomas:
      - add hash file
      - fix license information: use comma as a separator in
        <pkg>_LICENSE, and htable is under LGPLv2.1+ and not GPLv2.1+
        (which doesn't exist)]

Thanks, and sorry for the long wait. Feel free to send a follow-up
patch bumping miraclecast if there's a more recent upstream version
available.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
