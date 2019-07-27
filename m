From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 26 Jul 2019 23:25:22 -0300
Subject: [Buildroot] [RFC PATCH 4/4] Add linker override to config
 options
In-Reply-To: <20190724173538.22913-5-joseph.kogut@gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
 <20190724173538.22913-5-joseph.kogut@gmail.com>
Message-ID: <CAJ4jsad2fnpgqUq0bqtXz9f2ZQ9CJhEo2KcTi49NKqO5-a4PpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 24, 2019 at 2:35 PM Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[...]
>
> +ifeq ($(BR2_LINKER_LLD),y)
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_LINKER='"lld"'

Sorry for the nitpicking but Buildroot normally uses the "BR2_" prefix
fo perhaps this should be "BR2_LINKER"

-- 
Carlos Santos <unixmania@gmail.com>
