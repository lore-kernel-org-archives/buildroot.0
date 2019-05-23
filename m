From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 09:05:36 +0200
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.1.2
In-Reply-To: <20190522225048.5cd52098@windsurf.home> (Thomas Petazzoni's
 message of "Wed, 22 May 2019 22:50:48 +0200")
References: <20190522153314.10699-1-francois.perrad@gadz.org>
 <20190522225048.5cd52098@windsurf.home>
Message-ID: <87lfyxtzun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 22 May 2019 17:33:13 +0200
 > Francois Perrad <fperrad@gmail.com> wrote:

 >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 >> ---
 >> package/luarocks/luarocks.hash | 2 +-
 >> package/luarocks/luarocks.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to next, thanks.

Should this go into master instead? The commit message again
unfortunately does not explain it, but looking at the git history,
3.1.1..3.1.2 only seems to contain a bugfix:

https://github.com/luarocks/luarocks/commits/v3.1.2

Francois?

-- 
Bye, Peter Korsgaard
