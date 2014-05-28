From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 28 May 2014 17:29:03 +0200
Subject: [Buildroot] [PATCH] package/exim: security bump
In-Reply-To: <1401289619-17456-1-git-send-email-yann.morin.1998@free.fr>
References: <1401289619-17456-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <538600BF.4030308@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Bump exim to get an urgent security fix.
>
> We should not be impacted, since we're not building with DMARC (where
> the flaw is), but better safe than sorry.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

[Built-tested with ARM Sourcery toolchain, various configs]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
