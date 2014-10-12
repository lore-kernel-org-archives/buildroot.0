From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 12 Oct 2014 14:39:47 +0200
Subject: [Buildroot] [PATCH 1/1] Bump libubox, libuci to last versions,
 add ubus package
In-Reply-To: <1413098996-358-1-git-send-email-swexru@gmail.com>
References: <1413098996-358-1-git-send-email-swexru@gmail.com>
Message-ID: <CAGm1_kvofnWhbRdRFfYRzfmANfn-_VJVYn=z-C1+z9=6J5QnBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Sun, Oct 12, 2014 at 9:29 AM, Alexey Mednyy <swexru@gmail.com> wrote:
> Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/libubox/libubox.mk                     |  2 +-
>  package/libuci/libuci.mk                       |  2 +-
>  package/ubus/Config.in                         | 11 ++++++++++
>  package/ubus/ubus-01-json-definition-fix.patch | 28 ++++++++++++++++++++++++++
>  package/ubus/ubus.mk                           | 26 ++++++++++++++++++++++++

Glad to see, that someone else is working on bringing OpenWrt stuff to
BR. Have you tried to run LuCI on BR? What is still missing to run
OpenWrt on BR?

Regards,
Yegor
