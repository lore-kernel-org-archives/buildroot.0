From: Mike Zick <minimod@morethan.org>
Date: Sun, 29 Jun 2014 14:46:38 -0500
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion
 and internal variables
In-Reply-To: <20140629131427.2A9F19CFC7@busybox.osuosl.org>
References: <bug-7172-163@https.bugs.busybox.net/>
 <20140629131427.2A9F19CFC7@busybox.osuosl.org>
Message-ID: <20140629144638.66b520d4@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Jun 2014 13:14:27 +0000 (UTC)
bugzilla at busybox.net wrote:

> https://bugs.busybox.net/show_bug.cgi?id=7172
> 
> --- Comment #13 from Thomas De Schampheleire
> <patrickdepinguin@gmail.com> 2014-06-29 13:14:26 UTC --- Mike, 
> 
> Would you care to send patches to the mailing list to implement these
> changes? In a first step, the 'Now' comment, 
>

The 'Now" comment is just a text message edit -
that is within my paygrade to handle.  ;)

And maybe an addition to the "known bugs" in the manual.
I think this one will be around for a long time.

> and then the alternative
> you proposed. Having the changes on the mailing list will facilitate
> the discussion and review, as few developers look at the bug comments.
> 

The "fix" (work-a-round) of assigning the output of a:
 "printf '%s' '$' 'ORIGIN' ... "
I was using, was in a post image build script (outside of Buildroot).
(I no longer need an '$ORIGIN' - changed my planning to not need it.)

I don't know the "Make" equivalent, nor where in the infrastructure
the change needs to be made.

Something way outside of my paygrade I am afraid.

That will have to wait for someone very familiar with the BR
infrastructure to have a long lasting attack of boredom and
free time.

Mike
> Thanks, Thomas
> 
