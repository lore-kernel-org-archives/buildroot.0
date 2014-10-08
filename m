From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 8 Oct 2014 11:01:45 +0100
Subject: [Buildroot] [PATCH] package/trinity: New package
In-Reply-To: <87mw96evci.fsf@dell.be.48ers.dk>
References: <1412594507-48779-1-git-send-email-Vincent.Riera@imgtec.com>	<874mvffs2a.fsf@dell.be.48ers.dk>
 <54350771.9000208@imgtec.com> <87mw96evci.fsf@dell.be.48ers.dk>
Message-ID: <54350B89.8020508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 10/08/2014 10:58 AM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
> Hi,
>
>   >> execinfo.h is only available if uClibc is built with
>   >> UCLIBC_HAS_BACKTRACE=y (which it isn't by default).
>   >>
>   >> Perhaps the backtrace() stuff can get #ifdef'ed out if not available?
>
>   > It looks like a change to be made upstream. Maybe it needs to include
>   > a header check in the configure.sh script, then defining a macro if
>   > the header is present, and then modify the source code to take that
>   > macro into account to do things like "#ifdef USE_EXECINFO"...
>
>   > So, what do you propose by now for the Buildroot package? Disabling it
>   > for uClibc until upstream fixes that?
>
> Either that or submit a patch upstream.

Let's disable it by now. I don't have enough understanding of the inners 
of that package to be able to do that patch right now, so I will just 
send an email upstream requesting that fix.

I will send the new patch in a while.

Thanks.

-- 
Vincent
