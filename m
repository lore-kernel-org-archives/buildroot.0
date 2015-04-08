From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:20:38 +0200
Subject: [Buildroot] [PATCH] raspberrypi2: kernel version does no more
 exist
In-Reply-To: <1428480480-6422-1-git-send-email-jezz@sysmic.org>
References: <1428480480-6422-1-git-send-email-jezz@sysmic.org>
Message-ID: <20150408232038.4942770f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed,  8 Apr 2015 10:08:00 +0200, J?r?me Pouiller wrote:
> It looks like version 2c4959b of Raspberry kernel does no more exist:
> 
> $ git clone https://github.com/raspberrypi/linux.git
> [...]
> $ cd linux
> $ git co 23c76b7f608e51258c6fca02aebeb5d588583149
> fatal: reference is not a tree: 23c76b7f608e51258c6fca02aebeb5d588583149
> 
> Replace it by lastest version of 3.19 branch
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Yeah, the RPi people are annoying, they constantly rebase their
branches so there's no way to have a stable commit. Yann posted an
issue to their github: https://github.com/raspberrypi/linux/issues/915.
Maybe we need to look into what they propose, apparently they have some
stable branches.

I've nonetheless applied your commit, after tweaking the commit log.

(Hint: "does no more exist" isn't proper English as far as I know, you
should say "does not exist anymore" I believe. Though I'm not a native
English speaker, so I might be wrong.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
