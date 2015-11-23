From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 21:51:14 +0100
Subject: [Buildroot] [PATCH 1/3] core/pkg-autotools: align host
 configure commands to target one
In-Reply-To: <20151123210942.3bc09adc@free-electrons.com>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
 <20151123183829.077c602c@free-electrons.com>
 <20151123175112.GF3857@free.fr>
 <20151123210942.3bc09adc@free-electrons.com>
Message-ID: <20151123205113.GI3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-23 21:09 +0100, Thomas Petazzoni spake thusly:
> On Mon, 23 Nov 2015 18:51:12 +0100, Yann E. MORIN wrote:
> > > >  package/pkg-autotools.mk | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > Applied to next, thanks.
> > 
> > In the cover-letter, I suggestd this be applied to master. Did you
> > overlook that part, or did you apply to next on-purpose? Ditto the
> > second patch.
> 
> What would the reasoning to apply such patches on master? They don't
> fix any problem or bug, so they have no reason to be applied on master.
> They are good for consistency and documentation, but this is clearly
> not enough to justify being merged for master IMO.

No problem for them in next. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
