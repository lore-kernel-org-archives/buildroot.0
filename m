From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 16:43:18 +0200
Subject: [Buildroot] [PATCH/next] package/vlc: bump version to 2.2.6
In-Reply-To: <20170531224229.79773118@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 31 May 2017 22:42:29 +0200")
References: <20170524211317.3831-1-bernd.kuhls@t-online.de>
 <20170531224229.79773118@free-electrons.com>
Message-ID: <87wp7p7f95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 24 May 2017 23:13:17 +0200, Bernd Kuhls wrote:
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/vlc/vlc.hash | 4 ++--
 >> package/vlc/vlc.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Applied to next, thanks.

Committed to 2017.02.x and 2017.05.x, after updating the commit message
to clarify that this is in fact a security bump as it fixes
CVE-2017-8312, thanks.

-- 
Bye, Peter Korsgaard
