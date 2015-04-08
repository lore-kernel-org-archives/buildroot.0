From: Steve Kenton <skenton@ou.edu>
Date: Wed, 08 Apr 2015 17:15:29 -0500
Subject: [Buildroot] [PATCH v5 1/1] tovid: new package
In-Reply-To: <20150405114514.355707a4@free-electrons.com>
References: <1427038513-5368-1-git-send-email-skenton@ou.edu>
 <20150405114514.355707a4@free-electrons.com>
Message-ID: <5525A881.3000404@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
On 04/05/2015 04:45 AM, Thomas Petazzoni wrote:
> 
> Applied, with some minor changes:
> 
>     Thomas
It looks like Tovid has finished moving from SVN to github.

Github Green "Latest release" button for Tovid shows:

https://github.com/tovid-suite/tovid/releases/download/v0.35.0/tovid-0.35.0.tar.gz

I could not find any indication of a hash file - does github offer them anywhere
that I'm missing? Computed the one below locally after downloading. Is sha256sum
still preferred hash for local computation?

$ sha256sum tovid-0.35.0.tar.gz
06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz

Are uploaded tarballs still preferred for projects on github?

Not quite sure how to submit the change over.


Steve Kenton
