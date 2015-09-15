From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Sep 2015 14:49:34 -0700
Subject: [Buildroot] User question UTF-8
In-Reply-To: <55F88BEC.1060306@mind.be>
References: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
 <55F88BEC.1060306@mind.be>
Message-ID: <CAJJ6jxt7-Rr3ssoB_mra8kaUwST2M1AREfQ-YvbE7UE0urKSGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Sep 15, 2015 at 2:21 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Busybox and python are completely unrelated. In python 2, you'll have to
> explicitly encode/decode the filenames with the appropriate character set. The
> default character set is ascii, not utf-8. In python 3, there is an environment
> variable that you can set to default to utf-8, though.
>
>  Regards,
>  Arnout
>
Hi Arnout,

Yes I know. I started by discovering the utf-8 problem in python using
os.walk. I then tried to simplify the problem by getting the filenames
to work with just the os (linux 4.1.4 and busybox).

Python 2.x just barely supports utf-8 and seems to require that the os
agree with the support, at least for os.walk. It took lots of fiddling
to get it to work on Raspian too.

Thanks for helping,

Steve
