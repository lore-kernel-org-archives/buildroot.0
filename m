From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Dec 2013 12:08:58 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-07
In-Reply-To: <87haajborq.fsf@dell.be.48ers.dk>
References: <20131208073009.673C5101507@stock.ovh.net>
 <CAHt8ZCNu8Nwzh1LfD00CQ3CTMsS8NQ51GmdM+9QiRfzg-s_ShQ@mail.gmail.com>
 <87haajborq.fsf@dell.be.48ers.dk>
Message-ID: <20131208120858.1d8636b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 08 Dec 2013 11:50:01 +0100, Peter Korsgaard wrote:

>  > I've sent patches upstream to fix some of the gpsd build failures. The
>  > 3.11 release is expected within days; so, unless there are objections
>  > here, I'll hold off backporting a load of gpsd patches into Buildroot
>  > for the time being.
> 
> That's fine. If it's a simple git revision version bump then we can
> certainly update in the mean time, but I also prefer to not add a bunch
> of local patches if it is going to be fixed upstream very soon.

In the mean time, can we revert the problematic patches from Buildroot,
so that we get sane autobuild results? Having 27 failures on gpsd
within a day means that we're hiding several other potential problems
in other packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
