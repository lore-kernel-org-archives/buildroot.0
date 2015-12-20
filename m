From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:54:12 +0100
Subject: [Buildroot] RFC: Patch series for Kodi 16-Jarvis
In-Reply-To: <vjiikcxh6u.ln2@ID-313208.user.individual.net>
References: <3sigkcxlsq.ln2@ID-313208.user.individual.net>
 <vjiikcxh6u.ln2@ID-313208.user.individual.net>
Message-ID: <20151220135412.652a8344@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 20 Dec 2015 13:13:19 +0100, Bernd Kuhls wrote:

> after a first review by Thomas I just updated the branch.

Thanks. I don't know if others will agree, but I believe it might make
things easier to review if all the very simple "bump version" patches
for all kodi add-ons were merged into a single patch. I know we
normally don't do that, but it would make the series a lot shorter, and
would emphasize the few updates for which it's not just a mechanical
bump. So, this "big" commit would only contain the version bumps for
the packages that don't require anything but a change to the version.
If you need to do more than that, then it should be in a separate
commit per package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
