From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Tue, 26 Nov 2013 10:59:11 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-25
In-Reply-To: <20131126115331.6389b4cb@skate>
References: <20131126073003.0DD121014E8@stock.ovh.net>
 <20131126115331.6389b4cb@skate>
Message-ID: <52947EFF.3060402@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/26/2013 10:53 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 26 Nov 2013 08:30:02 +0100 (CET), Thomas Petazzoni wrote:
>
>>      mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b575154552a06c414a2ef2a39f572523ccd7bf54/
>>      mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/12fd65f29ae90559762456faa6e949968201cbe2/
>
> These builds.
>
>>      mipsel |               gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/e07a73638feb7b4992973299f1096eef1e5032e4/
>
> and this one are now fixed. They were caused by the external toolchain
> being built for MIPS IV, but we have deprecated MIPS IV support
> recently, so by default, mipsel is now mips32. So I've just rebuilt the
> Buildroot external toolchain for mips32, and it fixes those problems.
> I've also started updating the Buildroot external toolchains to use
> toolchains produced with 2013.11-rc2, but not all toolchains have been
> updated yet.
>
> Best regards,
>
> Thomas
>

Thank you Thomas.

-- 
markos
