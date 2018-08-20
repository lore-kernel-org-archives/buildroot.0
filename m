From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 05:47:50 -0700
Subject: [Buildroot] [PATCH 00/13] perl modules again
In-Reply-To: <20180820142842.003ef9fa@windsurf>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820141037.5b4c40cb@windsurf>
 <CALURroQZ6oZtCjC8ZFuHYhodhKNPMNAj=DtKLWERFXL-=5LaqA@mail.gmail.com>
 <20180820142842.003ef9fa@windsurf>
Message-ID: <CALURroQBXXmywB0T99OW7crwhZVOz52yDYoEHmw3FY7HG0pFTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2018 at 5:28 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 20 Aug 2018 05:15:58 -0700, Christopher McCrory wrote:
>
> > Copy and paste error, Oops. There are 18 patches
>
> It cannot be a copy/paste error if done right: the cover letter is
> generated automatically by "git format-patch --cover".
>
>
Something like:

commit 13 patches
git  format-patch  --cover-letter   -M -n -s -o perl origin/next
edit perl/0000-cover-letter.patch
commit more
git  format-patch  --cover-letter   -M -n -s -o perl2 origin/next
edit perl2/0000-cover-letter.patch
copy in text from previous edit including subject

:(



Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180820/46008ddd/attachment.html>
