From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:29:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-backports-ssl-match:
 bump to version 3.7.0.1
In-Reply-To: <20190930123302.28215-5-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
 <20190930123302.28215-5-asafka7@gmail.com>
Message-ID: <20191002222927.288948e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 15:32:31 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> LICENSE.txt file was moved to the root directory (same sha256).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

The title of the commit didn't match the actual package name, which is
python-backports-ssl-match-hostname. This broke one of my typical
testing thing when I look at many version bumps at once:

make $(git log --format=%s HEAD~34.. | cat | sed 's%^package/\([^:]*\):.*%\1-legal-info%'  | tr "\n" " ")

I fixed the commit title when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
