From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 22:15:09 +0200
Subject: [Buildroot] [PATCH 01/10] arch: deprecate the AVR32 architecture
In-Reply-To: <CAAXf6LVdbcEWFWPa_4QfpS3Od7bRsVDieb1odmdNmiEN+3ZGVg@mail.gmail.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LVdbcEWFWPa_4QfpS3Od7bRsVDieb1odmdNmiEN+3ZGVg@mail.gmail.com>
Message-ID: <20140701221509.26996537@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 1 Jul 2014 20:35:13 +0200, Thomas De Schampheleire wrote:

> While I have no trouble at all with the deprecation of avr32, the
> timeline you propose deviates from the usual deprecation timeline.
> When I introduced the BR2_DEPRECATED_SINCE_XXXX symbols, we proposed
> to take one year (four buildroot releases) as deprecation time, so
> deprecating avr32 2014.08 would mean being able to remove it by
> 2015.08.
> 
> I'm ok with explicitly stating the removal happening already in
> 2014.11, contrary to the usual timeline, provided there is a consensus
> with other buildroot developers.

Yes, I know that the proposed timeline for the removal of AVR32 support
deviates from the usual guideline of a one-year notice. However, AVR32
has become such a pain to maintain, with apparently no users caring
about it, that I don't feel like supporting that for one more year. I
agree that there should be a consensus amongst the Buildroot developers
about this, so I'm hoping to collect a bunch of Acked-by on this patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
