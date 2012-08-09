From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Aug 2012 14:06:29 +0200
Subject: [Buildroot] [RFC] "select" vs. "depends on" : a proposal for a
	workaround
In-Reply-To: <CA+wH296dDQGFnu2rcYD5VZq9RYK3Q1qfxHc6x4dWghfQ4DwCjQ@mail.gmail.com>
References: <201208072252.18028.yann.morin.1998@free.fr>
 <20120809133053.51033341@skate>
 <CA+wH296dDQGFnu2rcYD5VZq9RYK3Q1qfxHc6x4dWghfQ4DwCjQ@mail.gmail.com>
Message-ID: <201208091406.29481.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, Thomas, All,

On Thursday 09 August 2012 13:57:02 Alex Bradbury wrote:
> On 9 August 2012 12:30, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Le Thu, 9 Aug 2012 11:58:19 +0200,
> > I must admit I still see this as a workaround for a
> > deficiency/limitation of kconfig. It's true that it will make our
> > package Config.in files a bit less obvious to understand.
> 
> Is that "I'd prefer to see a patch to add this functionality to
> buildroot's kconfig?".

I think that kconfig changes should go upstream (ie. the linux kernel) first.

Such a change will probably be very intrusive; and there are very
kconfig-knowledgeable persons on the linux-kbuild ML that can rhelp eview
such an impacting change.

Of course, nothing prevents one from testing that change against buildroot! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
