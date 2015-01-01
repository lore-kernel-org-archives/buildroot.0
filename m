From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 23:19:39 +0100
Subject: [Buildroot] [PATCH] linux: change DEvice Tree prompt
In-Reply-To: <20150101231453.66938a36@free-electrons.com>
References: <1420150099-13977-1-git-send-email-yann.morin.1998@free.fr>
 <20150101231453.66938a36@free-electrons.com>
Message-ID: <20150101221939.GM4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-01 23:14 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> Minor typo in title, but another comment below.
> 
> On Thu,  1 Jan 2015 23:08:19 +0100, Yann E. MORIN wrote:
> 
> >  config BR2_LINUX_KERNEL_DTS_SUPPORT
> > -	bool "Device tree support"
> > +	bool "Build a Device Tree Blob (DTB)"
> 
> We can actually build several DTBs. Is this worth caring about in the
> phrasing of the option prompt?

Yes, I pondered that for, like, two seconds, and decided to not care.
So, I don't care if you make that a plural before comitting. ;-)

However, making that a "one or more DTBs" thingy would be pretty much
less intelligible, I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
