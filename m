From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 12 Feb 2014 09:43:29 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-11
In-Reply-To: <20140212093914.69646118@skate>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <CAHkwnC-iFrY2BXRCWzE6DhLEBt90c9vfmT76ofUKk=eJg4Ox7w@mail.gmail.com>
 <20140212093914.69646118@skate>
Message-ID: <CAHkwnC9CQ_eoH6cxRR_XV0UuLADmmo8eRG1numsVjbMQnS8DHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 12, 2014 at 9:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 12 Feb 2014 09:36:40 +0100, Fabio Porcedda wrote:
>
>> >     xtensa |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/2c6b9fdfffe81042d7606893d1ff006f9e6c4296/
>>
>> I will send the updated patch  to disable static building for lvm2.
>
> Is it fundamentally unable to do static linking?

No, it can be fixed, i've already sent a patch for that:
http://patchwork.ozlabs.org/patch/312469/
The patch is to disable shared building and effectively use the static binaries.

But the patch was not sent upstream because it needs more work to be
able to sent upstream so Peter suggested to just disable static
building.

Both solutions are fine for me.

Best regards
-- 
Fabio Porcedda
