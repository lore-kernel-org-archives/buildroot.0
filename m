From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 17 Jul 2014 08:24:48 +0800
Subject: [Buildroot] [PATCH 3/7 v3] package/ncurses: Allow building wide
 char support
In-Reply-To: <CAAXf6LWC_CzguzqpnLbAvyHedqVf6chkZhJYELzmfFjhnq0z7g@mail.gmail.com>
References: <1402982507.184990.682485888591.3.gpush@pablo>
 <53B6DD23.9040605@zacarias.com.ar>
 <CAAXf6LWC_CzguzqpnLbAvyHedqVf6chkZhJYELzmfFjhnq0z7g@mail.gmail.com>
Message-ID: <53C717D0.6090907@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Could any of you respin and repost the patch with this comment taken
> into account?

Sure, will do.

Gustavo - is this breakage simply with BR2_PREFER_STATIC_LIB? or is
there some better way to reproduce this issue, so I can ensure my new
patch fixes this?

Thanks,


Jeremy
