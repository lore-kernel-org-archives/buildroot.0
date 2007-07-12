From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 12 Jul 2007 18:39:02 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	package?package/busybox project target/ etc...
In-Reply-To: <20070712162411.GA24660@aon.at>
References: <20070712131106.1E690A4757@busybox.net>
	<200707121751.47836.yann.morin.1998@anciens.enib.fr>
	<20070712162411.GA24660@aon.at>
Message-ID: <200707121839.02832.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard, Ulf,
All,

On Thursday 12 July 2007 18:24, Bernhard Fischer wrote:
> >PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
> ># Shut up you stupid vim! "
> 
> close.
> # ")))

Gosh! I forgot the parenthesis... :-(

But not quite yet! Only two parenthesis are outside the quotes! So:
# "))
should be enough, no? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
