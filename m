From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 17:35:22 +0100
Subject: [Buildroot] [PATCH 2/5] package/runc: fix version output ldflags
In-Reply-To: <20201230092820.4084f84f@windsurf> (Thomas Petazzoni's message of
 "Wed, 30 Dec 2020 09:28:20 +0100")
References: <20201216080013.547261-1-christian@paral.in>
 <20201216080013.547261-2-christian@paral.in>
 <20201230092820.4084f84f@windsurf>
Message-ID: <8735zf8hpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 16 Dec 2020 00:00:09 -0800
 > Christian Stewart <christian@paral.in> wrote:

 >> Fix the ldflags specifying the version info for "version" command.
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
 >> ---
 >> package/runc/runc.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
