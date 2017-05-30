From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 00:10:40 +0200
Subject: [Buildroot] [PATCH 16/16] ejabberd: bump to version 17.04
In-Reply-To: <20170530145211.15320-17-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-17-johan.oudinet@gmail.com>
Message-ID: <20170531001040.4e76fca8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 16:52:11 +0200, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

I find the commit log a bit too terse compared to all what it does.
It's not a straightforward version bump, with just the version and hash
being changed. There are new dependencies, new patches, patches being
refreshed. Summarizing this in the commit log would be nice.

I would have applied anyway if the previous patches didn't had issues,
but since there are things that prevent applying this patch, I thought
I would mention this :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
