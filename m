From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 22 Aug 2010 11:23:40 +0200
Subject: [Buildroot] disable fpu
In-Reply-To: <29503725.post@talk.nabble.com>
References: <29503725.post@talk.nabble.com>
Message-ID: <201008221123.40921.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jny, All,

On Sunday 22 August 2010 10:40:53 JNY wrote:
> The image I've produced is for a kernel with requires fpu, but the CPU does
> not have this feature.  How can I alter the configuration to build an image
> which doesn't require fpu?

In the menuconfig, go to:
  Toolchain -->

And select:
  [*] Use software floating point by default

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
