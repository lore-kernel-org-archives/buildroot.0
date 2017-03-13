From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:26:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: fix pcre support
In-Reply-To: <20170312141410.35411898@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 12 Mar 2017 14:14:10 +0100")
References: <20170312121203.8626-1-bernd.kuhls@t-online.de>
 <20170312141410.35411898@free-electrons.com>
Message-ID: <874lywwyff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 12 Mar 2017 13:12:03 +0100, Bernd Kuhls wrote:
 >> The current code contains some obvious typos.
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/git/git.mk | 4 ++--
 >> 1 file changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks. Peter: this is really a bug fix, maybe we
 > want it for the LTS version?

Yes, I agree. Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
