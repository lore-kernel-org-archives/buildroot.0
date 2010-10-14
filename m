From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 14 Oct 2010 15:46:17 -0500
Subject: [Buildroot] mkfs.jffs2 image is not usable
In-Reply-To: <87y6a0edbw.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
	<4CB5A0BB.2040106@zacarias.com.ar>
	<0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
	<87y6a0edbw.fsf@macbook.be.48ers.dk>
Message-ID: <0D753D10438DA54287A00B02708426976450C42946@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, October 14, 2010 1:20 PM, Peter Korsgaard wrote:
>>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:
>>
>> Suggestions?

> You could also try going back to mtd-1.3.1, E.G. reverting
> a9b783379271e - Maybe something is broken upstream?

That fixed the problem.

Reverting a9b783379271e allows me to create a jffs2 that works.

Regards,
Hartley
