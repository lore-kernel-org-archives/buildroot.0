From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:12:57 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/gettext: update wint_t.m4
 from gnulib
In-Reply-To: <20170525215647.10315-1-bernd.kuhls@t-online.de>
References: <20170525215647.10315-1-bernd.kuhls@t-online.de>
Message-ID: <20170528161257.4840e1c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 23:56:46 +0200, Bernd Kuhls wrote:
> Needed for coreutils bump to 8.27
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../gettext/0002-Update-after-gnulib-changed.patch | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 package/gettext/0002-Update-after-gnulib-changed.patch

I've applied both patches to next. However, what would be nice is to
submit upstream the coreutils patch. Once upstreamed, we will be able
to stop autoreconfiguring coreutils, which would be a better solution.

Of course, in the mean time, gettext will have probably released a new
version containing the win_t fix, but upstreaming our coreutils patch
would nonetheless be a good thing.

Could you look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
