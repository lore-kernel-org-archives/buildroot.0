From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 11:16:58 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140223110021.16b6b976@skate>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
Message-ID: <CAAXf6LV8wcWi_dtnMvLnGgSgfJQZrRabZv6O98G+fjxvQScg0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3ce992a663ddf1030a987bb778f8275a8e5fdef0/
>
> To be investigated.
>

My proposal would be to disable webkit on powerpc. As I wrote in the
previous analysis mail, there is already an upstream bug report for
this, without a lot of feedback. If someone wants to have webkit on
powerpc, he/she should take the matter upstream.

If you agree, I can send a patch for it...

Best regards,
Thomas
