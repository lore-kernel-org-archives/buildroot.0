From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 May 2014 18:38:50 +0200
Subject: [Buildroot] OpenGL issues affecting the autobuilders
In-Reply-To: <20140512220140.5fe69970@free-electrons.com>
References: <20140512220140.5fe69970@free-electrons.com>
Message-ID: <20140513163849.GA3507@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-12 22:01 +0200, Thomas Petazzoni spake thusly:
> With the RPi OpenGL implementation
> ==================================
> 
> Cairo fails to build, see
> http://autobuild.buildroot.org/results/285/2851069d6964aa46d26b4aabe7d84e8c0c6c72ce/build-end.log.
> Error is:
> 
>   fatal error: vcos_platform_types.h: No such file or directory

OK, we've identified the error for this build: more than one openGL
provider was selected, so there is a mismatch (am ess!) between the
headers and the libs.

To be fixed some way, investigation in progress...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
