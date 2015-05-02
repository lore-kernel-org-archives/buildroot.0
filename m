From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 14:00:26 +0200
Subject: [Buildroot] [PATCH 15/30] package/matchbox-common: break
 dependency chain for display
In-Reply-To: <5543DBC1.4010706@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <decaf19e18b41b46067fa48d59ba2171e4893598.1429725549.git.yann.morin.1998@free.fr>
 <5543DBC1.4010706@mind.be>
Message-ID: <20150502120026.GA4232@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 22:02 +0200, Arnout Vandecappelle spake thusly:
> On 22/04/15 20:09, Yann E. MORIN wrote:
> > Currently, matchbox-common depends on either matchbox-dsktop or
> > matchbox-panel, and the three are organised so that matchbox-common gets
> > indented in the menuconfig.
> > 
> > That's a feature of menuconfig to consider the dependency chain to
> > indent sub-options.
> > 
> > Add a fake, prompt-less option to break that dependency chain.
> > 
> > Note: yes, this is an dirty hack.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  Now that you've moved the packages out of the matchbox/ directory and sorted
> them alphabetically, this is no longer needed.
> 
>  Or else, I missed the point :-)

No, that's correct. I'll drop this.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
