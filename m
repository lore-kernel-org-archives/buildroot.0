From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 9 Nov 2017 20:05:26 +0000
Subject: [Buildroot] [PATCH] python-numpy: disable for ARCompact
In-Reply-To: <20171108180214.03abd04b@windsurf>
References: <20171108164114.1041-1-didin@synopsys.com>
 <20171108180214.03abd04b@windsurf>
Message-ID: <1510257925.6333.34.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evgeniy,

On Wed, 2017-11-08 at 18:02 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> > 
> > The same issue appears building "trousers" package for ARCompact.
> 
> But trousers is not using python-numpy. Are you going to send a similar
> patch for trousers ?

I just realized that indeed "trousers" package disabled for any ARC,
which is obviously incorrect, given it's only ARCompact tools are affected.

Could you please send similar patch for trousers so in case of ARCv2
it becomes available for ARC.

-Alexey
