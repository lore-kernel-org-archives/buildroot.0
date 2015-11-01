From: Vicente <vicencb@gmail.com>
Date: Sun, 1 Nov 2015 21:00:40 +0000
Subject: [Buildroot] [PATCH v6 06/33] package/efl/libefl: new package
In-Reply-To: <CAAMcf8AEeazqU0Cx+pfuXP1zytprOnMrPs9R6Gu+-8BjotH=Sg@mail.gmail.com>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
 <1446401289-9059-7-git-send-email-romain.naour@openwide.fr>
 <CAAMcf8AEeazqU0Cx+pfuXP1zytprOnMrPs9R6Gu+-8BjotH=Sg@mail.gmail.com>
Message-ID: <CAAMcf8Dg_RywMAeTw5bKWfHQoVMP-DL0_LPNhvJa1z=LS0RNaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've just tested the branch "efl-1.15.2-for-buildroot-v6" from
> git://github.com/RomainNaour/buildroot.git
> with
> git cherry-pick 22e0f3a27eba84a381392617801d6ef0c0cc5539
> to add terminology as a test application for efl.

By the way, terminology does not work just out-of-the-box. It requires:
sed -i 's/TERMINOLOGY_DEPENDENCIES = efl
libelementary/TERMINOLOGY_DEPENDENCIES = libefl libelementary/'
package/terminology/terminology.mk
to work on this new patch series.
