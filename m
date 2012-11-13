From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Nov 2012 22:19:14 +0100
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <50A2B716.1070803@mind.be>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <CABtOAfyZQW+0KxtNF-cv-eFxBBqkMoyKAw1fSLgTN1WA-S8LrA@mail.gmail.com>
 <50A2B716.1070803@mind.be>
Message-ID: <201211132219.14720.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 13 November 2012 Arnout Vandecappelle wrote:
>> On 13/11/12 16:30, Alexander Khryukin wrote:
>>> I'm built rpm5 package but when i trying to run it i see
>>>
>>> [root at localhost rpm]# rpmbuild
>>> rpmbuild: error while loading shared libraries: libgomp.so.1: cannot open shared object file: No such file or
>>> directory
[--SNIP--]
> But still as an external toolchain, right?  Ouch, now I see crosstool-ng has the
> same problem...  But an internal toolchain should work, I think.

In crosstool-NG, libgomp is not automatically built. There is a config
knob to enable/disable build of libgomp (the default is not to build it).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
