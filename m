From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 24 Oct 2018 14:43:56 -0400
Subject: [Buildroot] [PATCH] PostgreSQL: bump version to 11.0
In-Reply-To: <7oj6afxmfc.ln2@ID-313208.user.individual.net>
References: <20181023171555.18043-1-aduskett@gmail.com>
 <n424afxool.ln2@ID-313208.user.individual.net>
 <CAFSsvmrWpqXHnzo-63j6D3jxCJVRuZgbzmMeX8hFiYqKtpL_Uw@mail.gmail.com>
 <7oj6afxmfc.ln2@ID-313208.user.individual.net>
Message-ID: <CAFSsvmrLzLsmc_JyP-4o2Y5qU=33h9G0TLH4VHJ9Jn9bPpRx3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd;

I am looking into adding JIT support, as it does speed up PG quite a bit.
If it proves to be difficult, I will submit a patch that adds the
--without-llvm
On Wed, Oct 24, 2018 at 12:38 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Am Wed, 24 Oct 2018 11:34:08 -0400 schrieb Adam Duskett:
>
> > So either 2 options:
> >
> > 1) Explicitly disable llvm using the flag --without-llvm
> > 2) Fix llvm detection.
>
> Hi Adam,
>
> unless 2) is easy to achieve we should go for 1).
> Personally I prefer 1) because I have no use for JIT.
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
