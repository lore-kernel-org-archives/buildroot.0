From: Mikael Eliasson <mikael@robomagi.com>
Date: Thu, 23 Aug 2018 16:03:22 +0200
Subject: [Buildroot] [PATCH 6/6] libb64: Fix integer overflow and
 uninitialized C++ objects.
In-Reply-To: <20180823134301.3923e2b7@windsurf>
References: <20180823103930.5112-1-mikael@robomagi.com>
 <20180823134301.3923e2b7@windsurf>
Message-ID: <CAMKz0Yrfc6U1d1u21U=iWhBuEQ7HbwhOE794JW39VvV8+94+2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2018-08-23 13:43 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Thu, 23 Aug 2018 12:39:30 +0200, Mikael Eliasson wrote:
> > Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
>
> Thanks Mikael for this patch. First of all, why is it PATCH 6/6 ? We
> did not receive anything else but this sixth patch. Did you had other
> patches in your series, or is this a mistake ?
>
I was following the tutorial(git format-patch -M -n -s -o outgoing
origin/master) and then it created patches for everything that has happened
in the my master branch. Not just what happened in the branch for this
patch. Thought that was weird but the official tutorial must be right. I
will resubmit with just the change for this patch.

>
> Also, could you provide some explanation in the commit log as to why we
> want those fixes ? Are there fixing security issues ? Runtime bugs ? A
> bit of context/explanation would be good to have.
>
Will do.
I will be using send-email to resend an updated patch.

>
> Also, since libb64 is maintained with Git (git clone
> https://git.code.sf.net/p/libb64/git libb64-git), could you use
> Git-formatted patches, for both patches (and therefore have both of
> them in package/, rather than download one from Debian, and have one in
> package/) ?
>
Will do.

>
> Have these patches been submitted upstream ?
>
The last change to the project was in 2013.

The oldest debian patch is from 2012 and has not been incorporated. Even
though the bug is quite serious.
And people have have been asking for changes in 2016 related to some of
these patches without a response.

So I think that page can be declared dead.


> Thanks!
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 
Mikael Eliasson
Telefon:
+46703900837
Email:
mikael at robomagi.com
Adress:
Robomagi AB
T?ngringsgatan 26A 78430 Borl?nge
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180823/b4fd84af/attachment.html>
