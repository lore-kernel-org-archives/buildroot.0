From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:15:08 +0200
Subject: [Buildroot] [PATCH 3/4] package/transmission: fix inotify
 configure option
In-Reply-To: <20180520153705.0f864601@windsurf> (Thomas Petazzoni's message of
 "Sun, 20 May 2018 15:37:05 +0200")
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
 <20180502060540.11628-3-bernd.kuhls@t-online.de>
 <20180520153705.0f864601@windsurf>
Message-ID: <87bmch9g9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed,  2 May 2018 08:05:39 +0200, Bernd Kuhls wrote:
 >> The configure option is really called --with-inotify:
 >> https://github.com/transmission/transmission/blob/2.9x/configure.ac#L211
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/transmission/transmission.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
