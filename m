From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 17:09:33 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <87vbc3xgcq.fsf@dell.be.48ers.dk>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
 <55DB7994.8080509@mind.be> <87vbc3xgcq.fsf@dell.be.48ers.dk>
Message-ID: <20150826170933.4501e3e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, 25 Aug 2015 22:28:37 +0200, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >  I'm not going to comment on all the points made here, but my stance
>  > is: lthough I also hate what the wf111 package does, I don't think
>  > it's bad enough to remove it from buildroot. It doesn't hurt the rest
>  > of buildroot at all, and it is a useful package for some users. I'd
>  > rather get rid of sparc than getting rid of this package.
> 
> I'm with Arnout here. While the download/binary blobs issues certainly
> aren't nice (and perhaps we would have had second thoughts when it was
> submitted if we had known about these issues)

From the commit log of the package:

    Adds support for the BlueGiga WF111 WiFi driver and the binary utilities
    distributed alongside the driver. An account is required to download the
    sources from the BlueGiga website, which can be created freely. The
    driver is available for armv5, arm7a and i386.
    
    Since it is not possible to automatically retrieve the sources, because
    of the required user account needed on the BlueGiga website, an option
    is added to let the Buildroot user specify the directory where the
    driver tarball was downloaded.

So it was 100% clear when the package was submitted that the tarball
cannot be automatically retrieved, and that creating an account was
needed to download the tarball.

See also the initial package submission:

    http://lists.busybox.net/pipermail/buildroot/2015-January/118194.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
