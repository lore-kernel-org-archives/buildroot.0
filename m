From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 11 Feb 2019 08:31:17 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-10
In-Reply-To: <20190211070049.9583F86786@whitealder.osuosl.org>
References: <20190211070049.9583F86786@whitealder.osuosl.org>
Message-ID: <CANQCQpYqP9n_xOTth+fHANhCO0uR-XCs8-E3TnmXJUr9Q6Exfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Feb 11, 2019 at 1:01 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2019-02-10
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  29 |   3 |   0 |  32 |
>    2018.11.x |  30 |   2 |   0 |  32 |
>       master | 267 |  77 |   4 | 348 |
>         next |  28 |  12 |   0 |  40 |
>
> Results for branch '2018.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                    attr-2.4.48 | 1
>                host-efl-1.20.6 | 1
> neardal-33b54a55032b047fd88... | 1
>
>
> Detail of failures
> ------------------
>
>         bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/38a79d1c22931fcab4a45b3413f0a45ed1795703 |
>          arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/05e8fdd28450a5961941b18d4f13827ed05b3aa8 |
>          arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/7ae0a9f887d79380581ee8331f871bc3040fa7d5 |
>
> Results for branch '2018.11.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                      efivar-35 | 2
>
>
> Detail of failures
> ------------------
>
>     mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/0b9ae8e039598bd533ff586bce7c99f5de450f1c |
>       mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/3dc9438feab7f90f9aa16f1c6c516dcd38821748 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>  brcm-patchram-plus-legal-info | 13
>                  qt5base-5.6.3 | 12

Anyone looking at this one?  If not, I'll continue figuring it out
this week when I've got time.

Thanks!
Matt
