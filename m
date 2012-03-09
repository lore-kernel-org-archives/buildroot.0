From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 08:06:23 +0100
Subject: [Buildroot] [RFC] Request for comment for branch
	for-2012.05/misc-cleanups
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWhUefC7igy8nbDLdJT-o4o36QoX_9xcVUri6a=tSryTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 7, 2012 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is a set of proposal that cleanup/re-organize a few parts of our
> main Makefiles. This is just the beginning of a cleanup of Makefile,
> package/Makefile.in and some other core parts of the
> infrastructure. Before going further, I'd like to see if the direction
> I'm taking is something that is considered to be useful and
> interesting.
>
> This set of patches is at the Request For Comment state, they are not
> yet intended to be committed, I need to do some further testing. The
> purpose is really to get some early feedback about them.

Thanks for this cleanup. I think the reorganization of the *targets
infrastructure and the move of its related bits from other files will
certainly make the whole cleaner. And I also like the removal of the
unneeded variables.

I tried validating these patches by grepping/reviewing the code, and I
don't really expect surprises related to broken stuff. But of course,
it's good that you do some further testing.

Best regards,
Thomas
