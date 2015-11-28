From: Alexey Galakhov <agalakhov@gmail.com>
Date: Sat, 28 Nov 2015 12:06:05 +0100
Subject: [Buildroot] [PATCH 1/1] core: add option to force compiling C++
 as C++11
In-Reply-To: <5658F43E.70103@mind.be>
References: <1448549404-11670-1-git-send-email-agalakhov@gmail.com>
 <20151126175115.58c84720@free-electrons.com>
 <20151126214314.278f4531.agalakhov@gmail.com>
 <5658F43E.70103@mind.be>
Message-ID: <20151128120605.7a31558d.agalakhov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Nov 2015 01:24:30 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Well, we _have_ packages that build with --std=c++11 or similar, and
> that use boost. For example pulseview. So I would think we would see
> build failures there as well.

Most of the boost acts as a header-only library and thus does work even
in this situation. Linking with -lboost_filesystem is a notable
exception.

Regards,
Alexey
