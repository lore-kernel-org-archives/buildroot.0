From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Oct 2018 14:54:19 +0200
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/pkg-stats: URL check
 using threads
In-Reply-To: <5bb4123cbed5b_6f723fa9ec08e7bc6558f@ultri5.mail>
References: <1538447849-46511-2-git-send-email-matthew.weber@rockwellcollins.com>
 <5bb4123cbed5b_6f723fa9ec08e7bc6558f@ultri5.mail>
Message-ID: <20181003145419.2f76fe63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Tue, 02 Oct 2018 21:50:04 -0300, Ricardo Martincoski wrote:

> On Mon, Oct 01, 2018 at 11:37 PM, Matt Weber wrote:
> 
> > Adds a pool of worker threads to accelerate connection testing.
> > 
> > ~7.5MB and 2% CPU per thread on a Intel i5-3230M CPU @ 2.60GHz.
> > 
> > Runtime is ~3min in parallel vs ~15min.
> > 
> > CC: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>  
> 
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

So this threading works for you? I think it is modeled after what I
initially did to retrieve the upstream version of the packages, and you
said it wasn't working well for you.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
