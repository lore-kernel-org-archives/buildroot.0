From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2012 00:58:14 +0100
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <50906736.90602@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <201210310035.38831.yann.morin.1998@free.fr> <50906736.90602@mind.be>
Message-ID: <201210310058.15006.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 31 October 2012 Arnout Vandecappelle wrote:
> On 10/31/12 00:35, Yann E. MORIN wrote:
> >> >     There is still an alternative: patch Kconfig to "properly" handle
> >> >  select/depend transitivity.  I.e., when a symbol selects another symbol,
> >> >  this implies that all dependencies of the other symbol are inherited.  Did
> >> >  anyone ever investigate the feasibility of such an feature?
> > Yes. Both Thomas and I have had a look (but separately). I got an headache
> > each time I tried to understand the kconfig code. IIRC, Thomas' experience
> > was a bit in the same vein.
> >
> > My point of view is that we must consider (unless proven otherwise) that
> > modifying kconfig to handle this select/depends mess is not possible.
> 
>   I completely agree.  But if it had been easy to do, it might have been
> preferable over adding verbosity to Config.in.
> 
>   In that case, I guess I'll have to take the time to review those patches
> before Saturday :-)

I am supposed to send an updated series tomorrow evening.
"Supposed to", that's the problematic phrase in this sentence.

I am late. So late.

But on the other hand, this new series would not be very different from
the last I sent, so I wonder if it really makes sense to re-post.

But, I want to send an email that sums up the state of the change:
  - for the series as it is:
    - what's been done
    - where there are issues
    - what's left to do
  - for future work:
    - options dependening on another package
    - package depending on option of another package
    - ...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
