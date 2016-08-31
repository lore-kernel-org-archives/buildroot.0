From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 09:14:43 +0200
Subject: [Buildroot] [PATCH 00/16 v3] br2-external: support multiple
 trees at once (branch yem/multi-br2-external-ID-7)
In-Reply-To: <874m611n1e.fsf@dell.be.48ers.dk>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <eda2b290-992f-7a26-424b-f522b7a805ae@mind.be>
 <874m611n1e.fsf@dell.be.48ers.dk>
Message-ID: <20160831091443.691ffd1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 08:15:57 +0200, Peter Korsgaard wrote:

>  >  Supporting the old single-external without name in parallel with the new named
>  > approach takes a significant amount of code - I estimate about 40 lines, out of
>  > 285 lines affected by this patch set...  
> 
>  >  So, I repeat: I think the backward compatibility should be dropped here.  
> 
> That also sounds sensible to me.

I originally insisted to keep the backward compatibility, but Arnout's
argumentation convinced me that it is not really necessary. And if it
can help reduce the implementation complexity, I'm all for it.

So: I'm fine with dropping backward compatibility on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
