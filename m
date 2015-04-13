From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Apr 2015 08:33:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: Fix build errors due to
	new ffmpeg
In-Reply-To: <XnsA47B45649D829berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1428875137-16284-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1428875137-16284-2-git-send-email-maxime.hadjinlian@gmail.com>
 <XnsA47B45649D829berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <CAGduivwwS9L5w0bFAeit-D1CN_tjEjothMkcmjTCG_3OjEeTig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Ah ! I was quick to detect it but slow to send it.
Anyway, I'll change this in the patchwork.

On Mon, Apr 13, 2015 at 6:49 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote in
> news:1428875137-16284-2-git-send-email-maxime.hadjinlian at gmail.com:
>
>> This patch applies what can be found with in the pull request:
>> https://github.com/xbmc/xbmc/commit/dfe123f23a5e933c8f0f3367f24630de2beb2
>> 9ec
>
> Hi,
>
> this fix is already in buildroot ;)
> http://git.buildroot.net/buildroot/commit/package/ffmpeg/0013-add-public-ve
> rsion-of-ff_read_frame_flush.patch?id=032e2beedfe7f503f0686470ae930d4c8b41b
> 780
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
