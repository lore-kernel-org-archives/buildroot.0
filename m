From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Sep 2008 20:31:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
In-Reply-To: <20080905125303.GA31755@cloud.net.au> (Hamish Moffatt's message
	of "Fri\, 5 Sep 2008 22\:53\:03 +1000")
References: <20080905010349.6D501F800B@busybox.net>
	<87iqtagbry.fsf@macbook.be.48ers.dk>
	<20080905125303.GA31755@cloud.net.au>
Message-ID: <87y726cumj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> 	default "1.12.0"	if BR2_BUSYBOX_VERSION_1_12_X

 Hamish> How's it different?

It's different in the sense that the Kconfig symbol is called
BR2_BUSYBOX_VERSION_1_12_X, so the configuration doesn't change if you
bump the minor version (Yes, I know it isn't done for the legacy
versions, simply because that would break existing configs).

The freetype equivalent would be BR2_FREETYPE_VERSION_2_3_x.

Hope this makes it more clear.

-- 
Bye, Peter Korsgaard
