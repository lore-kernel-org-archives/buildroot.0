From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 19 Mar 2021 14:52:57 -0700
Subject: [Buildroot] [PATCH 2/2] support/download: print command used
 for download
In-Reply-To: <20210319204218.GQ3443324@scaer>
References: <20210115150047.6895-1-patrickdepinguin@gmail.com>
 <20210115150047.6895-2-patrickdepinguin@gmail.com>
 <20210316222938.GI3443324@scaer> <20210318210133.GK3443324@scaer>
 <CAAXf6LUom6Q6wvzDvxr4RDdzMoBY5kcmq4TbWiy=xWq1JibBaw@mail.gmail.com>
 <20210319061948.GM3443324@scaer>
 <CAGt4E5vmZqP4RtcxLptbu3Vd5Z04CCqumJYv+-SVQwQPxrwRjA@mail.gmail.com>
 <20210319204218.GQ3443324@scaer>
Message-ID: <CAGt4E5sETpkG5RZ9rFAAFJYrhBefZ-MS2oSb2ZAMhz7qTsumgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Mar 2021 at 13:42, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> On 2021-03-19 11:24 -0700, Markus Mayer spake thusly:
> > FWIW, we've been bitten by this, too. Not our main branch, mind you.
> > But on the "let's build the latest upstream branch and see if there
> > are any surprises coming down the pipe" branch. And it sure found a
> > little surprise for us.
>
> Yeah, that was a serious issue, but we're still pretty early in the
> development phase, so now is a good time to break things! ;-)

No harm was done. I was just scratching my head a little. :-)

> Hopefully that's been settled now, with commit b70ce56651, that's been
> just merged. Feedback greatly appreciated if there's still feedback (or
> not).

I re-tried the build with the new commit, and I am happy to report
that the fix seems to be working as intended. No more errors from GIT.
The build completed successfully.

Regards,
-Markus
