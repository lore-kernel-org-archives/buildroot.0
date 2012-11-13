From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Nov 2012 22:31:11 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <50A2B9CF.9010007@mind.be>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <201211132219.14720.yann.morin.1998@free.fr> <50A2B9CF.9010007@mind.be>
Message-ID: <201211132231.11510.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 13 November 2012 Arnout Vandecappelle wrote:
> On 13/11/12 22:19, Yann E. MORIN wrote:
> > In crosstool-NG, libgomp is not automatically built. There is a config
> > knob to enable/disable build of libgomp (the default is not to build it).
>   Yes, it's also not built by default in the internal toolchain.  But if it is
> built, then libgomp.so should be installed in $(TARGET_DIR) - and currently it
> isn't.

Yes, that's right. I'll cook up a patch for that shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
