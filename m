From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Feb 2020 16:27:09 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <CAJtjsKanOr6knqJeDJ84hv-68NdQRs164_NnTAkPsVAB16mYjg@mail.gmail.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205154226.0dca67b1@windsurf>
 <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
 <20200210143008.1895547d@windsurf>
 <CAJtjsKanOr6knqJeDJ84hv-68NdQRs164_NnTAkPsVAB16mYjg@mail.gmail.com>
Message-ID: <CAJtjsKYB4GkZu5xp-ak9BYEkarqKB6yQiHGf0F1foQf6EjV+qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2020 at 4:20 PM Johan Oudinet <johan.oudinet@gmail.com> wrote:
> Hopefully, this file ssl.d is already present in the archive. So I
> think a fix would be to remove bootstrap from the path to logger.hrl
> via a sed command before calling make?
>
> This might be a good idea to report this error upstream as well.

There is no deps directory inside lib/ssl/src in the last release of
erlang (22.2.6). I guess this was a left over from the guy who made
the archive?
So my fix proposition to simply sed this file won't work in future
erlang versions.
-- 
Johan
