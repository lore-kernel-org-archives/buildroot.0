From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Jul 2015 10:52:57 -0300
Subject: [Buildroot] [PATCH 1/2] binutils: use binutils 2.24 by default
 on the target
In-Reply-To: <1436619173-17434-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436619173-17434-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55A3C2B9.7060400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/07/15 09:52, Thomas Petazzoni wrote:

> When binutils is not built for the host, binutils.mk decides of the
> version to be used when building binutils for the target. We're still
> using the old 2.22 binutils version, but it's time to bump up to 2.24,
> which we already use as the default version for the host.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
