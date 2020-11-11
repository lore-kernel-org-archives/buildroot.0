From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 11 Nov 2020 11:32:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix regression for
 static linking issue
In-Reply-To: <20201111081807.16075-1-heiko.thiery@gmail.com>
References: <20201111081807.16075-1-heiko.thiery@gmail.com>
Message-ID: <CAEyMn7at1nswAkAxdWf+VJ=C4-DYe2J-tF_5WtnmjnRVTbFM+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Hi Jan,

Am Mi., 11. Nov. 2020 um 09:27 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> 9c13e02c35c74eca56e69f2bbfde452b51860f5e already fixed the static linking
> issue for host-libcap on some distros (e.g. on Fedora32 and openSUSE).
>
> This regression was introduced by 8d38eb052e7006b6e74e9453351d7f245144481e.
>
> An upstream patch [1] is added to address this problem [2].
>
> Fixes:
> Bug 13296
>
> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=9b1c003748d4df78416d50fce139f0875224440b
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=210135
>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Dr I J Ormshaw <ian_ormshaw@waters.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Could someone please recheck that patch and add a tested-by?

Thank you. Regards
-- 
Heiko
