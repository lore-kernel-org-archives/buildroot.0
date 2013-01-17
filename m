From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 17 Jan 2013 16:18:25 +0000
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F8019C.4000003@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com> <20130117000037.39ccc628@skate>
 <50F74776.60503@petroprogram.com> <20130117093159.2d46ecfd@skate>
 <50F8019C.4000003@petroprogram.com>
Message-ID: <CA+wH296eA55hCFSpuuX8TVDhxt7EpnVmAT0p5ciV39x_qZnW-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 January 2013 13:50, Stefan Fr?berg
<stefan.froberg@petroprogram.com> wrote:
> And if even *that* is not enought then I could consider maybe switching
> to musl ... maybe ...

I've been following musl for a while - it really might be worth giving
a go. They're aiming to be more lightweight than Glibc, while more
functional than uclibc. Plus some musl patches for buildroot and
crosstool-ng would be kind of awesome ;)

Alex
