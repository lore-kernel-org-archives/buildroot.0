From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 10:02:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <87zidba6ff.fsf@dell.be.48ers.dk>
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
 <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
 <87zidba6ff.fsf@dell.be.48ers.dk>
Message-ID: <20170618080218.GA2566@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Rahul, All,

On 2017-06-14 00:06 +0200, Peter Korsgaard spake thusly:
> >>>>> "Rahul" == Rahul Bedarkar <rahulbedarkar89@gmail.com> writes:
> 
>  > On Mon, Jun 12, 2017 at 9:45 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>  >> 
>  >> README was renamed to README.md
>  >> https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34
> 
>  > make <pkg>-legal-info should have caught that after version bump as a
>  > part of testing. But it looks like we don't do that usually. In past,
>  > we have seen such failures after version bump.
> 
>  > To avoid such failures, we can add hash of license file in <pkg>.hash
>  > and checking that after source is downloaded. If license file changes,
>  > it will be noticed while build test after version bump.
> 
>  > Potentially, it will also help in keeping license string of packages
>  > up-to-date if it gets changed. What do you think ?
> 
> Yes, this is something I have been thinking about as well (but not found
> time to implement yet). +1 from here!

I've sent a propsal for that:
   http://lists.busybox.net/pipermail/buildroot/2017-June/194820.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
