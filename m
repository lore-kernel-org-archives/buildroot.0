From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 22:58:53 +0100
Subject: [Buildroot] [PATCH 1/1] gcc: fix powerpc64le arch config name
In-Reply-To: <1480979238-18273-2-git-send-email-nunes.erico@gmail.com>
References: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
 <1480979238-18273-2-git-send-email-nunes.erico@gmail.com>
Message-ID: <CACXmViZOEfLuAn3Q+7MaidGEayb4qSZmCgvXajOD3dXjFbYfmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 6, 2016 at 12:07 AM, Erico Nunes <nunes.erico@gmail.com> wrote:
> Buildroot references powerpc64 little endian as BR2_powerpc64le and not
> BR2_powerpc64el.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Committed, thanks.


--
Bye, Peter Korsgaard
