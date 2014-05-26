From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 May 2014 07:04:14 -0300
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <20140526113727.6ac42e12@free-electrons.com>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>	<1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
 <20140526113727.6ac42e12@free-electrons.com>
Message-ID: <5383119E.9@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/2014 06:37 AM, Thomas Petazzoni wrote:

> While on principle I'm probably fine with the patch, I kinda disagree
> that it fixes the autobuilder issues. Because the same autobuilder
> issue will appear with an external toolchain that has both libstdc++.so
> and libstdc++.a.

This is a way to fix it for internal toolchains, i can build up to mpd
static with audiofile support with this, but it's not complete, that's
for sure.
Regards.
