From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 17 Sep 2008 15:56:13 +0200
Subject: [Buildroot] [RFC 1/1] libupnp: add package libupnp
In-Reply-To: <1221656399-25047-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1221656399-25047-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <20080917155613.47690d1c@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Sep 2008 14:59:59 +0200
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:

<snipp>

> +LIBUPNP_DEPENDENCIES:=uclibc
> +

The LIBUPNP_DEPENDENCIES is not needed AFAICT, so I'll scratch that.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
