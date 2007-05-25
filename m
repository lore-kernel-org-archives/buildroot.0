From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 25 May 2007 21:51:38 +0200
Subject: [Buildroot] Package selection question
In-Reply-To: <465737B9.8070008@gmail.com>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
Message-ID: <200705252151.38804.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tom,
All,

On Friday 25 May 2007 21:23, Tom wrote:
> So, even after I unchecked busybox and all packages, it still builds gmp 
> (and, unsuccessfully, mpfr). Why does it need it please and why is this 
> an option then? Or am I doing something wrong here?

gmp and mpfr are needed to build gcc. They are to run on host, not on target.
Can you post the build logs for mpfr (and gmp if it also fails)?

Regards,
Yann E. MORIN.

PS. gcc-4.1.x and earlier require neither gmp nor mpfr.
    gcc-4.2.x require gmp and mpfr to build fortran (at least, may be others)
    gcc-4.3.x will require gmp and mpfr to build all frontends.
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
