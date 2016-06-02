From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Jun 2016 13:27:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump version to 2.4.1
In-Reply-To: <20160601234021.10b0ee5a@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 1 Jun 2016 23:40:21 +0200")
References: <1463818975-16680-1-git-send-email-bernd.kuhls@t-online.de>
 <20160601234021.10b0ee5a@free-electrons.com>
Message-ID: <87a8j3u8yt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 21 May 2016 10:22:55 +0200, Bernd Kuhls wrote:
 >> This patch depends on http://patchwork.ozlabs.org/patch/624729/
 >> 
 >> Rebased 0002-obey-destdir.patch using upstream commit.
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/qlibc/0002-obey-destdir.patch              | 154 ++++++++++++++-------
 >> ...l-build-by-removing-usage-of-internal-gli.patch |  11 +-
 >> package/qlibc/qlibc.mk                             |   2 +-
 >> 3 files changed, 110 insertions(+), 57 deletions(-)

 > Applied to next, thanks.

You forgot to update _LICENSE_FILES, as the license file has been
renamed upstream. I've pushed a fix for this.

-- 
Bye, Peter Korsgaard
