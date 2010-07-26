From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 26 Jul 2010 18:40:06 +0200
Subject: [Buildroot] Buildroot licence for commercial product
In-Reply-To: <4C4DAE9A.4030402@terawatt.fr>
References: <4C4D5B7F.7020606@terawatt.fr> <20100726134259.2e2f5fc9@surf>
	<4C4DAE9A.4030402@terawatt.fr>
Message-ID: <201007261840.06451.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damien, All,

On Monday 26 July 2010 17:49:46 Damien Borie wrote:
> I don't know how I will give access to all licences text, copyright, and 
> source code, as the system is closed and nobody can connect to it except 
> us...

The easiest, IMHO, is to have a leaflet listing all packages you identified
and the name of the license that applies to each of them, plus the full text
for each license.

Then, for GPL-licensed (and similar licensed) packages, you can provide
access to the complete and corresponding source code on-line, eg. on a
FTP server. Bundling a CD with your product would be ultimate, and very
well regarded.

As a side note, be extra carefull about the toolchain, as parts of it will
end up on the target. Examples are the C library file (eg. libc.so.0,
libm.so.0, ...) and others (eg. libgcc.so.0 from gcc, ...). So you should
also count those packages in.

All this is from a non-lawyer, so you'd better check with yours.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
