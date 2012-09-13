From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 13 Sep 2012 13:33:08 +0100
Subject: [Buildroot] [network-manager] Apply upstream patch to fix
 compilation with kernel-headers >= 3.4
In-Reply-To: <87r4q6qkpk.fsf@macbook.be.48ers.dk>
References: <CAG2jQ8g+0WkYnR2k-8jaLXHOFRA2OPiuQWeD==B6gdE67N=4OA@mail.gmail.com>
 <877grzszx8.fsf@macbook.be.48ers.dk>
 <CAG2jQ8jTO66cWd8UG-=mxWgihLJf=RETGizK0q_8YOapUbGo3g@mail.gmail.com>
 <87r4q6qkpk.fsf@macbook.be.48ers.dk>
Message-ID: <CAG2jQ8jTD9dxAsCaVAMqowqzbRGT3iJk8jZV0+i-4W2pCCFvnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 13, 2012 at 11:29 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
> Hi,
>
>  Markos> There is no need to apply this patch if you bump the
>  Markos> package. This patch only fixes the compilation problem for
>  Markos> version 0.9.2.0, which is the one we have on buildroot.
>
> Ahh, I thought it was a post-0.9.6 change. Any reason to not just move
> to the latest upstream?
>
> I gather that you are using the network manager package? I'm not using
> it myself, perhaps you would be interested in testing 0.9.6?
>
> --
> Bye, Peter Korsgaard

Hi Peter,

Unfortunately I am not using networkmanager myself. I just hit this
problem in one of my buildroot compilation tests. There is no good
reason for not moving to the latest 0.9.6.0 release but since I don't
use it myself, I can't provide a patch for the version bump. All I can
do is a compilation test at the moment.

-- 
Regards,
Markos
