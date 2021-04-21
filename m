From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 23:27:54 +0200
Subject: [Buildroot] [PATCH] package/python-flup: update dependency to
 python3
In-Reply-To: <20210412164405.16890-1-matthew.weber@rockwellcollins.com>
References: <20210412164405.16890-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421232754.67464211@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Apr 2021 11:44:05 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Dependency incorrectly calls out python, should be python3
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/python-flup/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied with an extended commit log, based on additional
details provided by Matt.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
