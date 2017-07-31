From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 31 Jul 2017 20:27:59 -0300
Subject: [Buildroot] [RFC PATCH 2/4] support/testing: allow to use extra
 large timeouts
References: <20170731212504.7f4ebf3b@windsurf.home>
Message-ID: <597fbcffa7937_423beb827892640@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jul 31, 2017 at 04:25 PM, Thomas Petazzoni wrote:

> On Sun, 30 Jul 2017 01:49:44 -0300, Ricardo Martincoski wrote:
[snip]
>> +    parser.add_argument('-e', '--elastic-timeout', type=int, default=1,
>> +                        help='increase timeouts (useful for slow machines)')
> 
> I find the choice of the "elastic timeout" a bit weird. To me, it feels
> like a timeout that will reduce and extend like an elastic, not a
> timeout multiplier.
> 
> Perhaps we should call this --timeout-multiplier or something like
> that ?

Sure. I will fix and resend.
I will use -m as short name because -t is already in use.

Regards,
Ricardo
