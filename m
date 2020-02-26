From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Feb 2020 07:36:00 +0200
Subject: [Buildroot] external, how to achieve our needs?
In-Reply-To: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
References: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
Message-ID: <87imjtoqpr.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

On Tue, Feb 25 2020, Ludovic Desroches wrote:
> I would like to emphasize that recent changes in buildroot make us
> think that it won't be easy to get rid of buildroot-at91: devmem2
> deprecated, rgnd which increases the boot time since it uses the lib
> jitterentropy, curl library name change and others.

The curl library name has not changed in the last few year. Do you refer
to the curl binary Kconfig symbol name change (commit 2a057339cc12)? How
does that affect your use case? Do you need to support several Buildroot
versions in a single config?

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
