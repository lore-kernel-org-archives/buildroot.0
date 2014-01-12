From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 19:39:57 +0100
Subject: [Buildroot] [PATCH 00/14] Introducing XBMC
In-Reply-To: <bp3bqaxocd.ln2@ID-313208.user.individual.net>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <bp3bqaxocd.ln2@ID-313208.user.individual.net>
Message-ID: <CAGduivyrhP85chwgVvTv8Kvu2H020LoRS0b4v15zamLOtyFzUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Jan 12, 2014 at 7:33 PM, Bernd Kuhls <berndkuhls@hotmail.com> wrote:
> Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote in
> news:1389549208-19078-1-git-send-email-maxime.hadjinlian at gmail.com:
>
>> Also, it seems it can only build easily with external toolchain (a
>> missing bitdefs.h files).
>> It doesn't seems that uClibc is supported also.
>
> Hi,
>
> xbmc gotham supports uClibc:
> https://github.com/xbmc/xbmc/commit/0fdf7aa6a95f13b34edf42a6e42da47b4bebf68b
>
> You can backport the patch to frodo, several months ago I compiled that
> version successfully with a buildroot-compiled uClibc toolchain targeting
> BR2_ARCH="i586".
That's nice to know ! I'll push it once this patchset is accepted.
>
> After your patchset gets comitted I will add vaapi support for hw decoding.
Great :)
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
