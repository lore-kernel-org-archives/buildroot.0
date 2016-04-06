From: Geoff Levand <geoff@infradead.org>
Date: Wed, 06 Apr 2016 09:23:37 -0700
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <CA+h8R2pHQ3YWZXLCM+yoHD6i_KttOJ3wVTuhOo4PLUv0kS=CKg@mail.gmail.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <CA+h8R2pHQ3YWZXLCM+yoHD6i_KttOJ3wVTuhOo4PLUv0kS=CKg@mail.gmail.com>
Message-ID: <1459959817.8377.7.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-04-06 at 05:05 +0000, Christian Stewart wrote:
> However, I've read through the patches and everything looks good to
> me. Also, a test compile resulted in success for my target env.
> 
> Acked-by: Christian Stewart <christian@paral.in>

We haven't heard anything from Ludovic since I started this work. Both
yourself and Christian have reviewed my patches favorably.  I have
added in all the changes you recommended in your review.

I think these are now ready to merge.  I pushed out a go-v3.1 branch
that adds Christian's acked:

[1] https://github.com/glevand/buildroot--buildroot.git #go-v3.1

Please pull.

-Geoff
