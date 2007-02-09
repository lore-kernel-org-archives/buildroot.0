From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 9 Feb 2007 18:57:13 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <20070209142934.GA17891@aon.at>
References: <FA7EECCA3735EF46BE49245D249B788CE2E308@exchange1.wgate.com>
	<20070209142934.GA17891@aon.at>
Message-ID: <200702091857.13886.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,
All,

On Friday 09 February 2007 152, Bernhard Fischer wrote:
> I'm curious as to why you think we don't have -lfloat?

I din't say that either.
As I said in an earlier post, I don't use buildroot to build my toolchains
(because I need toolchains, not a rootfs, and for other technical reasons).

For reference, I'm using a highly modified version of crosstool, please see:
  http://sources.redhat.com/ml/crossgcc/2007-02/msg00009.html

> Could somebody please follow up on
> http://www.busybox.net/lists/buildroot/2007-January/001182.html

Quoted from the message referenced above:
> Please edit package/libfloat/libfloat.mk
> and remove the check for the gcc version 3.3 and let me know if that
> fixed it.

I'm gonna give it a try in the WE. The fact that having to link with an
external library when gcc has the adequate code seems odd to me... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
