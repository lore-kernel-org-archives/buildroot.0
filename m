From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 23 May 2014 11:32:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-22
In-Reply-To: <20140523063008.8A64410106F@stock.ovh.net>
References: <20140523063008.8A64410106F@stock.ovh.net>
Message-ID: <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 23, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-05-22
> ===============================
>
>         success : 107
>        failures : 11
>        timeouts : 0
>           TOTAL : 118
>
> Classification of failures by reason
> ====================================
>
>                  httping-2.3.4 | 1
>                       qt-4.8.6 | 1
>                alsa-lib-1.0.26 | 1
>                  mplayer-1.1.1 | 1
>                audiofile-0.3.6 | 1
>                     php-5.5.12 | 1
>              dosfstools-3.0.26 | 1
>                   python-2.7.6 | 1
>                   cppcms-1.0.4 | 1
> package/rpi-userland/rpi-us... | 1
>               gst1-libav-1.2.4 | 1
>
> Detail of failures
> ===================
>
>    powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/520606ec674f6c8efad6ebbb840099ec89d03130/
>     x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc21623fbc3d4e94f09b2cb0be36ce05cf75a2e6/

It's related to BR2_PREFER_STATIC_LIB=y, I'm trying to fix it.

Regards
-- 
Fabio Porcedda
