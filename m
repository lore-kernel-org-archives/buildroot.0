From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Dec 2014 19:12:19 +0100
Subject: [Buildroot] [buildroot-test 2/2] Enable paranoid path checking
In-Reply-To: <1418852858-818-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1418852858-818-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141218181219.GA4589@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-17 22:47 +0100, Thomas Petazzoni spake thusly:
> Now that Buildroot has support for paranoid path checking (check for
> clearly invalid header and library directories used when
> cross-compiling), let's enable this in the autobuilders.
> 
> Without this, the paranoid path checking only emits warnings. With
> this patch enabled, whenever an invalid header or library path is
> used, the build will stop and fail, which will allow us to clearly
> notice such cases.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Do we want to apply this right now? We already have a lot of failures
> caused by the static/shared change. Do we want to have more?

Well, either we set it right now, so we have time to investigate before
the 2015.02 release, or we post-pone that for after.

We're almost one mont in the release cycle, with a bit more than another
month before rc1, so it might be already too late for the switch, but it
is still doable.

So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
