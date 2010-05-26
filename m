From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 26 May 2010 19:55:07 +0200
Subject: [Buildroot] [git commit master] webkit: remove user visible
	rendering target selection
In-Reply-To: <20100526152252.484cd6a7@surf>
References: <20100526122002.1355C1EB@busybox.osuosl.org>
	<20100526152252.484cd6a7@surf>
Message-ID: <201005261955.07336.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On Wednesday 26 May 2010 15:22:52 Thomas Petazzoni wrote:
> Technically speaking, I don't think any X11 client applications
> requires the server. Instead, it probably requires xlib_libX11 and
> maybe some other additional libraries.

Yes, I do agree. I can think of at least one headless box that I run
X11 applications on, via an 'ssh -X'.

> But, I admit that this isn't handled properly in all packages, and as
> soon as one wants a X11 application, one probably also want the X
> server as well, in most situations.

I'm afraid that 201005 wil have to live with that, and people that are
interested (like I am) in a configuration for headless+X11 contribute
the necessary changes for a future release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
