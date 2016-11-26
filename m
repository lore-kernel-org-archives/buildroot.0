From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:05:24 +0100
Subject: [Buildroot] [PATCH v2 2/3] pru-software-support: add library
 for PRU firmware
In-Reply-To: <1c417375-fe37-9cc8-5747-87c670b3e51f@mind.be>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-2-git-send-email-ash.charles@savoirfairelinux.com>
 <1c417375-fe37-9cc8-5747-87c670b3e51f@mind.be>
Message-ID: <20161126150524.476da6e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 12:27:14 +0100, Arnout Vandecappelle wrote:

> > +++ b/package/pru-software-support/pru-software-support.hash
> > @@ -0,0 +1,2 @@
> > +# no hash for git checkout  
> 
>  Where do you get this from? It's been more than a year now that this is no
> longer true, do we still have documentation bits saying that there should be no
> hash for git downloads?

Correct, but they are not checked, so it isn't really obvious today
that we want to have hashes for git downloads.

But still: please add a locally calculated sha256 hash.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
