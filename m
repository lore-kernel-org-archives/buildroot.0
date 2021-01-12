From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Jan 2021 15:21:45 +0100
Subject: [Buildroot] package/dotnet: add host-dotnet-sdk
In-Reply-To: <CABWPoFG2q8n27nSULRf1mh7ook=wSOJq1uw8xCTLcWmudEdo2A@mail.gmail.com>
References: <CABWPoFG8k9WccFXRKC6ufRLKDHzdwCyeN3Q1PJZzqpg83fwc1w@mail.gmail.com>
 <20210104085858.68f57652@windsurf>
 <CAOiXNkARyVd8=v7ZShcdAw7eZHDY+Apf5_vLDsxiGT-tpGsEvg@mail.gmail.com>
 <CABWPoFFFA_jB0bqBSGDmnk+7YvM6br0=7=KcnKUvnctVrvmQNA@mail.gmail.com>
 <CAOiXNkBPm8ksDHTWXrzA9zmFZxShEWSOSeG4pn0r3iYRZxKq6g@mail.gmail.com>
 <CABWPoFH_UbU=b7T5yr2Wf23E1fz-dGe+SuVkiMqJGNtYXitLFg@mail.gmail.com>
 <CABWPoFG2q8n27nSULRf1mh7ook=wSOJq1uw8xCTLcWmudEdo2A@mail.gmail.com>
Message-ID: <20210112152145.4d84029e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Raul,

On Tue, 12 Jan 2021 10:09:05 +0100
Raul Hidalgo Caballero <deinok@deinok.com> wrote:

> Hi Thomas,
> 
> Made a patch here: https://github.com/deinok/buildroot/pull/1/files
> If it looks good I will send it all joined as a .patch file.

Thanks for the updated patch.

Could you please submit as a patch on the Buildroot mailing list, so
that we can give some review/feedback ?

> Fixed all the issues except for:
> Testing -> Do you have an example for testing a host package?

The test case you have is already good. What would be better is to have
the test case use the dotnet SDK to really build an example program,
and then run it on the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
