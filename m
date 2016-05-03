From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 00:54:53 +0200
Subject: [Buildroot] [PATCH v8] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <20160503213950.GA3676@free.fr>
References: <1462178199-21742-1-git-send-email-romain.izard.pro@gmail.com>
 <3d1045a9-c349-6195-34a8-f69c074dfaaa@mind.be>
 <20160503213950.GA3676@free.fr>
Message-ID: <c688cb39-f8bd-0df7-324a-ba48d44c6d7a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/03/16 23:39, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-05-03 23:20 +0200, Arnout Vandecappelle spake thusly:
[snip]
>>  However, bottom line I don't think this improves the situation sufficiently
>
> No, I don't think it does. I'm not opposed to using support scripts, but
> in this case I don't think it is really needed.
>
> I did prefer the shell construct in the Makefile, because it is a bit
> easier to read than the make construct, but it does not work and it's
> not like the make construct is totally unreadable.

  Same here. I just wanted to put the reasoning behind it on record in the ML 
archives.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
