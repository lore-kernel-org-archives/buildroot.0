From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:41:50 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/pinentry: bump version to
 1.0.0
In-Reply-To: <20170917151836.3661-1-bernd.kuhls@t-online.de>
References: <20170917151836.3661-1-bernd.kuhls@t-online.de>
Message-ID: <20170917184150.417cee54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Sep 2017 17:18:35 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=f0db3192463cccf4541820de36d985629c4df6ee
> 
> Added sha256 hash.
> 
> Added dependencies to libassuan & libgpg-error needed after
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=302903f76b8d62b1e07219a203f7219cb3aff7d8
> 
> Removed CXXFLAGS added for gcc >= 5.x as noted by Thomas:
> https://git.buildroot.net/buildroot/commit/package/pinentry?id=9694305ae0b2a7dbdcc74e2c646d392ceed9876f
> 
> Renamed configure option -pinentry-qt4 to -pinentry-qt after
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=abb59f50abf698ff1e56490fb39bcc98c26ab44b
> Qt5 support, also added by this upstream commit, will be added to this
> package with a subsequent commit.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Added rename of configure option -pinentry-qt4 to -pinentry-qt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
