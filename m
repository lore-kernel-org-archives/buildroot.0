From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 26 May 2007 12:22:39 +0200
Subject: [Buildroot] Package selection question
In-Reply-To: <20070526092343.GB15885@aon.at>
References: <4656F77D.30303@teamboyce.co.uk>
	<200705252245.32243.yann.morin.1998@anciens.enib.fr>
	<20070526092343.GB15885@aon.at>
Message-ID: <200705261222.39950.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,
All,

On Saturday 26 May 2007 11:23, Bernhard Fischer wrote:
> On Fri, May 25, 2007 at 10:45:32PM +0200, Yann E. MORIN wrote:
> >I don't have mpfr here and gcc-4.1.2 does build OK. I do have gmp, but gcc does
> >not linked against it.
> Fair enough, in 4.1, only the fortran frontend needs it.

So gmp and mpfr are needed for Fortran from 4.1 onward. I thought only 4.2
would need them. I didn't stumble upon this as I don't do Fortran...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
