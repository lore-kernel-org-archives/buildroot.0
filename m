From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Jun 2014 18:15:22 +0200
Subject: [Buildroot] [PATCH 06/26] package/tzdata: bump version for some
	new timezones
In-Reply-To: <87ha3ymhg8.fsf@dell.be.48ers.dk>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
 <65531c070eb1214153e3a95b1bf837898af67448.1401656581.git.yann.morin.1998@free.fr>
 <87ha3ymhg8.fsf@dell.be.48ers.dk>
Message-ID: <20140606161522.GA3481@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-06-06 12:59 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > A few adjustments here and there, plus re-definition
>  > of the Crimea timezone.
> 
>  > New definition for the moment the Big-Bang occured, too. :-)
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> While reading lwn.net, I noticed this:
> 
> https://bugzilla.gnome.org/show_bug.cgi?id=730332
> 
> Have you noticed isses with glib-based programs?

No, the only application I'm currently using that displays a user-facing
clock is XBMC, which does not seem to use glib to handle the time.

> Do we need to patch glib?

I'll have a look at the two patches proposed in the PR you referenced
above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
