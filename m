From: Ashwin Bihari <abihari@gmail.com>
Date: Mon, 23 Oct 2006 08:58:00 -0400
Subject: [Buildroot] Buildroot for PowerPC
In-Reply-To: <1161600951.11223.6.camel@benakiva-laptop>
References: <1161592912.5391.5.camel@benakiva-laptop>
	<20061023094254.GA13298@aon.at>
	<1161600951.11223.6.camel@benakiva-laptop>
Message-ID: <1f11a5490610230558q47437eeerbbb4497e9297268d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/23/06, Itzhak Ben-Akiva <itzhakba@commtact.co.il> wrote:
>
> I set the variable CROSS_COMPILE in the Makefile file of busybox. It
> went ok.
>
> However, what burdens me is that somehow buildroot is trying the edit
> Rules.mak for powerpc.
>
>
Buildroot will take to make any necessary modifications to the original
files to get it to compile for the desired target. Sometimes that means
patching Makefiles. So this shouldn't be much of a surprise.

But, while building filesystems with Buildroot, you will find better luck if
you opt out of using the latest snapshot for the toolchain and busybox. If
you use the version that your particular version of Buildroot has in it's
configuration, that particular version was a known good version. You throw
away that certainty when you go with currnet snapshots for all your
programs.

Regards

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061023/ee6e3fe5/attachment.html 
