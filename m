From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jun 2013 16:29:37 +0200
Subject: [Buildroot] [PATCH] libunwind:  new package
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639A6B89D@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639A6A708@ex-mb1.corp.adtran.com>
 <20130622111525.3d15ac49@skate>
 <F9C551623D2CBB4C9488801D14F864C639A6B89D@ex-mb1.corp.adtran.com>
Message-ID: <20130624162937.75f6c3fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jun 2013 14:24:55 +0000, ANDY KENNEDY wrote:

> Thomas:  To what shall I set the License variable?
> 
> I have NO IDEA what it should be.  This isn't GPL code, not
> MIT, not BSD, nothing I've seen before.  All I know is that it
> is free of any restrictions, though copyrighted by HP.
> 
> Andy
> 
> License text:
> 
> Copyright (c) 2002 Hewlett-Packard Co.
> 
> Permission is hereby granted, free of charge, to any person obtaining
> a copy of this software and associated documentation files (the
> "Software"), to deal in the Software without restriction, including
> without limitation the rights to use, copy, modify, merge, publish,
> distribute, sublicense, and/or sell copies of the Software, and to
> permit persons to whom the Software is furnished to do so, subject to
> the following conditions:
> 
> The above copyright notice and this permission notice shall be
> included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Seeing this, I would probably do something like:

LIBUNWIND_LICENSE = libunwind license (BSD-like)

or something like that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
