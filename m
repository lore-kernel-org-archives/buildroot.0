From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 09:05:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <CAKAx1cjF8Q9ZTJXg4yxHkqQFFkzAEEKzU5V852XZtQMw=59LPw@mail.gmail.com>
References: <1423214752-29779-1-git-send-email-lionel.orry@gmail.com>
 <20150315232850.21412e3a@free-electrons.com>
 <CAKAx1cjF8Q9ZTJXg4yxHkqQFFkzAEEKzU5V852XZtQMw=59LPw@mail.gmail.com>
Message-ID: <20150316090508.6616c119@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Mon, 16 Mar 2015 07:43:11 +0100, Lionel Orry wrote:

> > So, replace AC_TRY_RUN with AC_TRY_LINK or something like that. Or
> > maybe there's even a simpler autoconf macro to test if a definition
> > exists or not.
> 
> the fact is, I was asked by Arnout to do it that way, and his opinion
> was that it was needed to run the snippet on the target to be sure of
> the resut. See:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/106055
> 
> Is there something I misunderstood ? Who has the final call about this ?

I am not sure I agree with Arnout suggestion, but...

> > Also, did you submit your patch upstream?
> 
> Yes I did, it has been merged into the next branch of zeromq, v4.1.x.

... since your patch has been merged upstream, I'm just fine with using
it as is.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
