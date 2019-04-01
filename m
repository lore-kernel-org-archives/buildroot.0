From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 1 Apr 2019 14:57:08 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-31
In-Reply-To: <20190401060047.F38C78756C@hemlock.osuosl.org>
References: <20190401060047.F38C78756C@hemlock.osuosl.org>
Message-ID: <20190401115708.GA5653@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Mon, Apr 01, 2019 at 06:00:41AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-03-31
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  48 |   3 |   0 |  51 |
>       master | 211 | 318 |   2 | 531 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
[SNIP]
>             host-vim-v8.1.0133 | 9 
[SNIP]
>       xtensa |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/0948ab6fd959940c836e06f5b632b36443a53451 | ORPH
>      aarch64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/cfa6f78caea012ea4423e807ce8ceb997bc1f908 | ORPH
>          arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/6d417ab6a0e369b6c7023ce7d40d9b31fa0adeaf | ORPH
>       x86_64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/4369725cdea72b168dfa760d54ac038f2e0506de | ORPH
>      riscv64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/a9b72f138595e39be51b37d93bc43e0e8a39e5f6 | ORPH
>      riscv32 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/dadf5e71942b807bb4d18108c043ce81b349781c | ORPH
>      sparc64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/05d48cc5ef1068537d45169a4930927060e1cd7a | ORPH
>       xtensa |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/993392c1213889e4e2bb9c06235d2f2f16a5cafe | ORPH
>      aarch64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/314acaa9e87e8e896a6af7d49ee0e59643ced500 | ORPH

This is very looks like a gettext-tiny's msgfmt issue, will try to look on it.

Regards,
Vadim Kochan
