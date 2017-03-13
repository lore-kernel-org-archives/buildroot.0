From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:22:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.2.9.10
In-Reply-To: <20170312142645.54c5f1f9@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 12 Mar 2017 14:26:45 +0100")
References: <20170311163259.12142-1-bernd.kuhls@t-online.de>
 <20170312142645.54c5f1f9@free-electrons.com>
Message-ID: <87h92wwynb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 11 Mar 2017 17:32:59 +0100, Bernd Kuhls wrote:
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/tor/tor.hash | 2 +-
 >> package/tor/tor.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

 > I wondered if that one has a security fix. It does have one according
 > to https://blog.torproject.org/blog/tor-02910-released:

 > """

 > Tor 0.2.9.10 backports a security fix for users who build Tor with the
 > --enable-expensive-hardening option. It also includes fixes for some
 > major issues affecting directory authorities, LibreSSL compatibility,
 > and IPv6 correctness.

 > """

 > But we don't pass --enable-expensive-hardening in Buildroot, so users
 > of our LTS branch should not be affected by this.

 > Peter: I leave it up to you to decide if we want this bump on the LTS
 > branch or not.

The release mentions several major bugfixes, so I've committed it to
2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
