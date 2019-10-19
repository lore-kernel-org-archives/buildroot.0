From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: fix
 libbsd detection
In-Reply-To: <XnsAAEDE4F5CCC08berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20191019074826.16026-1-bernd.kuhls@t-online.de>
 <ef53b723-6522-1803-e5a3-163a581abb91@mind.be>
 <XnsAAEDE4F5CCC08berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <5a771ca2-d2e1-8d14-7079-2fa89cb76b67@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2019 22:32, Bernd Kuhls wrote:
> Arnout Vandecappelle <arnout@mind.be> wrote in 
> news:ef53b723-6522-1803-e5a3-163a581abb91 at mind.be:
> 
>>  Why didn't you have a Fixes: tag?
> 
> Hi Arnout,
> 
> due to the meson-lzma problem the autobuilders did not catch the error.

 Even so, it's better to add a Fixes: tag followed by the failing compile
output, for two reasons:

- the failing compile output is something that may show up in web search results
and help people debug their problems;

- the Fixes: tag (even if not followed by anything) is marked in patchwork, and
those patches get higher priority (at least from me).

 Regards,
 Arnout
