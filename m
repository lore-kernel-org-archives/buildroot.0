From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jul 2015 13:38:57 -0300
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
	skeleton
In-Reply-To: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <55A7DE21.20900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/15 13:30, Maxime Hadjinlian wrote:

> If you select a custom skeleton, and have busybox or sysvinit as init,
> the install of their inittab would trigger, rendering yours useless.
>
> The hooks doing the sed in the skeleton package would only trigger for a
> default skeleton.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(for busybox)
