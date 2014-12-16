From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Dec 2014 18:31:49 +0100
Subject: [Buildroot] Buildroot autobuilders - Cleanup faulty tarballs
In-Reply-To: <20141216080256.09901ee4@free-electrons.com>
References: <20141215230340.GB4075@free.fr>
 <20141216080256.09901ee4@free-electrons.com>
Message-ID: <20141216173149.GA4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-16 08:02 +0100, Thomas Petazzoni spake thusly:
> On Tue, 16 Dec 2014 00:03:40 +0100, Yann E. MORIN wrote:
> 
> > Could you please remove the tarballs from SF-hosted packages on each
> > autobuilder instance you are running, please? You'll find that list
> > below.
> 
> Done.

OK, thank you! :-)

[--SNIP--]
>  * Probably a higher number of reports about failed downloads, since
>    wiping out the download directory means that the next builds will
>    re-download everything they need, which gives a higher probability
>    of downloading tarballs that have disappeared, or trying to reach
>    hosts that are down, etc.

Are you running your instances without a backup mirror configured? I
believe this is a good thing, because it will help find the missing
upstreams.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
