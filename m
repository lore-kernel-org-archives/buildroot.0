From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:19:01 +0200
Subject: [Buildroot] [PATCH V2 8/9] support/config.sub: Add C-SKY support
In-Reply-To: <20190527223022.1d1aaa5a@windsurf> (Thomas Petazzoni's message of
 "Mon, 27 May 2019 22:30:22 +0200")
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-8-git-send-email-guoren@kernel.org>
 <20190527223022.1d1aaa5a@windsurf>
Message-ID: <87k1dyivx6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Guo,
 > On Wed,  8 May 2019 16:58:34 +0800
 > guoren at kernel.org wrote:

 >> From: Guo Ren <ren_guo@c-sky.com>
 >> 
 >> Enable gnuconfig for C-SKY Architecutre compiling.
 >> 
 >> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
 >> ---
 >> support/gnuconfig/config.sub | 2 ++
 >> 1 file changed, 2 insertions(+)

 > I've slightly improved the commit message, and applied to master. I've
 > applied to master and not to next, because this commit is really
 > important: without it, none of the autotools based packages can build
 > on C-SKY (which is not yet tested in the autobuilders).

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
