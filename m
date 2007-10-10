From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 10 Oct 2007 22:06:06 +0200
Subject: [Buildroot] build error for nios2,
	based on kernel headers	selection
In-Reply-To: <Pine.LNX.4.64.0710091920470.14102@localhost.localdomain>
References: <Pine.LNX.4.64.0710091632500.6683@localhost.localdomain>
	<20071009213425.GV20951@aon.at>
	<Pine.LNX.4.64.0710091920470.14102@localhost.localdomain>
Message-ID: <20071010200559.GB20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 09, 2007 at 07:21:23PM -0400, Robert P. J. Day wrote:
>On Tue, 9 Oct 2007, Bernhard Fischer wrote:
>
>> On Tue, Oct 09, 2007 at 04:38:53PM -0400, Robert P. J. Day wrote:
>> >
>> >  first time taking a crack at buildroot, selected "nios2", at which
>>
>> Select BR2_DEPRECATED.
>> nios2 looks like not too well supported in various upstream packages.
>
>that doesn't appear to change anything,

Sure it does. Look carefully.
>                                        and i wouldn't have expected
>it to.

I expect it to show you some waaay outdated kernel headers.

>        what was the rationale in doing that?

The rational was that you're presented some very outdated kernel-headers
that you can select for nios2.
