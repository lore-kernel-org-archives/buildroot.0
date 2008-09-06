From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 6 Sep 2008 14:22:10 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
In-Reply-To: <87y726cumj.fsf@macbook.be.48ers.dk>
References: <20080905010349.6D501F800B@busybox.net>
	<87iqtagbry.fsf@macbook.be.48ers.dk>
	<20080905125303.GA31755@cloud.net.au>
	<87y726cumj.fsf@macbook.be.48ers.dk>
Message-ID: <20080906042210.GA29650@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 05, 2008 at 08:31:16PM +0200, Peter Korsgaard wrote:
> >>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
> 
> Hi,
> 
>  Hamish> 	default "1.12.0"	if BR2_BUSYBOX_VERSION_1_12_X
> 
>  Hamish> How's it different?
> 
> It's different in the sense that the Kconfig symbol is called
> BR2_BUSYBOX_VERSION_1_12_X, so the configuration doesn't change if you
> bump the minor version (Yes, I know it isn't done for the legacy
> versions, simply because that would break existing configs).
> 
> The freetype equivalent would be BR2_FREETYPE_VERSION_2_3_x.
> 
> Hope this makes it more clear.

Oh yes I see. Good suggestion, thanks.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
