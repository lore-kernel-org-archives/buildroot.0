From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 4 Sep 2008 11:05:29 +1000
Subject: [Buildroot] rfc: autotools xyz-clean target doesn't
	remove	stamp files
In-Reply-To: <d6cda7730809031230u724ae154na351591fa7876bb2@mail.gmail.com>
References: <20080903052110.GA11847@cloud.net.au>
	<d6cda7730809031230u724ae154na351591fa7876bb2@mail.gmail.com>
Message-ID: <20080904010529.GA16933@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 03, 2008 at 04:30:58PM -0300, Thiago A. Corr?a wrote:
> Hi,
> 
>     I don't really know much about the Makefile.autotools.in but your
> patch seams ok to me.
>     I would only suggest to prepend with - to ignore failed rm's that
> would occur if we do make clean to an incomplete build.

That's what the "rm -f" is for.

Thanks for your comments. I've committed this as r23312.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
