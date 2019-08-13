From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Aug 2019 09:05:40 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/systemd: drop
 host-intltool dependency
In-Reply-To: <20190812224808.491c3d47@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 12 Aug 2019 22:48:08 +0200")
References: <20190812175809.27786-1-fontaine.fabrice@gmail.com>
 <20190812224808.491c3d47@windsurf.home>
Message-ID: <87ftm5mtob.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 12 Aug 2019 19:58:09 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> intltool is not needed since version 236 and
 >> https://github.com/systemd/systemd/commit/c81217920effddc93fb780cf8f9eb699d6fe1319
 >> https://github.com/systemd/systemd/commit/9e8f3893e349a68312a817da72b3473b81b6869e
 >> 
 >> So drop it and replace it by TARGET_NLS_DEPENDENCIES
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/systemd/systemd.mk | 4 ++--
 >> 1 file changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

You applied to next (which is IMHO sensible).

-- 
Bye, Peter Korsgaard
