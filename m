From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 18 May 2010 15:06:17 +0200
Subject: [Buildroot] Buildroot 2010 rc2 fails to build
In-Reply-To: <AANLkTil700dIJdHHJ8md_AlfjpSO1BtLeI-CWcX2oHki@mail.gmail.com>
References: <AANLkTim8u-blOgAiVpxjWfe1VuQ06EUIsgJ0zz_jWYxw@mail.gmail.com>
	<58B9D5B09E114795948B69CA62CAB0CE@AP366>
	<AANLkTil4b1zC3nN148fwJSmxsdeg3Mm5hAFO-2Uvo8nJ@mail.gmail.com>
	<87bpcf3a6w.fsf@macbook.be.48ers.dk>
	<AANLkTil700dIJdHHJ8md_AlfjpSO1BtLeI-CWcX2oHki@mail.gmail.com>
Message-ID: <AANLkTilhvb0DfUPC9FWbf_UR9rXUGyQVhIwNSLyofmzm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 May 2010 23:29, Chris Kerios <ckerios@gmail.com> wrote:
[snip]
>?I also
> have a AVR32 NGW100 that I am beginning to work on that I will be testing
> buildroot on next.? I will let eveyone know how that one goes and cry for
> help when I get lost in buildroot...haha.

BR git master does not build atngw100_defconfig at the moment.
I submitted a patch yesterday that updates atngw100_defconfig so that
it builds again.
I hope it will be included in the 2010.05 release. Maintainers?

BTW, atngw100_defconfig works fine in version 2010.02.

Best regards,
Bj?rn Forsman
