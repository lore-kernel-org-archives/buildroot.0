From: Joakim Bech <joakim.bech@linaro.org>
Date: Tue, 29 Jan 2019 12:50:16 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <87tvhrzo8e.fsf@tarshish>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128170533.16555-1-joakim.bech@linaro.org>
 <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
 <20190129102608.4k3wfli3dyomb7aa@debby> <87tvhrzo8e.fsf@tarshish>
Message-ID: <20190129115016.54krjpwvffopjppr@debby>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 29, 2019 at 01:40:01PM +0200, Baruch Siach wrote:
> Hi Joakim,
> 
> On Tue, Jan 29 2019, Joakim Bech wrote:
> > So after looking a bit more into the git log of how patches where
> > created in the past it looks like I should create 4 patches, "pseudo git
> > log -4".
> > - toolchain-external: update Arm ARM 8.2-2019.01
> > - toolchain-external: update Arm AArch64-BE toolchain 8.2-2019.01
> > - toolchain-external: update Arm AArch64 toolchain 8.2-2019.01
> > - toolchain: add necessary options to support 5.0 kernel headers
> 
> The v5.0 headers patch should be the first in the series. Otherwise the
> toolchains will be selecting a non existing config symbol which hurts
> bisectability.
> 
Thanks for confirming, since I was thinking about that myself also.

-- 
Regards,
Joakim
