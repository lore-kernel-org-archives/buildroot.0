From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:41:04 +0200
Subject: [Buildroot] [PATCH 3/8] core/show-info: report install types
 for virtual packages too
In-Reply-To: <df507703c3c71ec7f2f774ee140bcde5cb9a8a5b.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <df507703c3c71ec7f2f774ee140bcde5cb9a8a5b.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200411104104.6a01dba7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:28 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Although virtual packages do not usually install anything, they do
> participate in the dependency chain, and they also transition smoothly
> from 'not handled yet' all the way down to 'all set'.

I'm having a hard time to understand what you mean by:

  they also transition smoothly from 'not handled yet' all the way down
  to 'all set'.

Could you clarify ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
