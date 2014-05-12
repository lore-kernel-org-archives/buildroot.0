From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 May 2014 22:53:24 +0200
Subject: [Buildroot] Discussing libudev,
 was: Re: [PATCH v6 09/32] mesa3d: dri2 does not need udev support
In-Reply-To: <pil74bx9op.ln2@ID-313208.user.individual.net>
References: <pil74bx9op.ln2@ID-313208.user.individual.net>
Message-ID: <20140512205324.GD3619@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-12 21:55 +0200, Bernd Kuhls spake thusly:
> Emil Velikov wrote:
> --- snip
> udev != libudev. The latter can be used without the presence of the former 
> as it is a selection of helper functions that helps abstract dev 
> manipulations.
> 
> AFAICS you have a couple options here - install libudev or keep a bunch of 
> local patches. I would encourage you go with the former.
> --- snap
> 
> This was an interesting piece of information for me because I am patching 
> xbmc to remove its libudev dependency in the cec-adapter detection part.
> While trying to setup Emil?s suggestion I created a libudev package which 
> was successfully linked by libcec and its binary cec-client to detect my 
> cec adapter so I guess Emil?s idea could really work.
> 
> I have yet to do more testing but reading through the udev/systemd/eudev 
> discussion of the last months here I would like to ask for feedback already 
> at this early stage whether a seperate libudev package is useful for the 
> broader public.

Short answer: yes.

Loang answer: yes, it would be interesting to the broader public. :-)

Now, this should be well integrated with the existing udev providers.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
