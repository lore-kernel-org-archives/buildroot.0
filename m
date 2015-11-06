From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 6 Nov 2015 14:13:59 -0300
Subject: [Buildroot] [PATCH v2 1/1] package/wpa_supplicant: add config
 option to build wpa_client library
In-Reply-To: <1446366918-4504-1-git-send-email-joerg.krause@embedded.rocks>
References: <1446366918-4504-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <563CDFD7.7060801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/15 05:35, J?rg Krause wrote:

> Version 2.5 of wpa_supplicant introduces the config option
> CONFIG_BUILD_WPA_CLIENT_SO to enable building wpa_client as shared library.
>
> We need to add a patch from upstream to fix a runtime error with
> libwpa_client.so:
>    Error relocating /usr/lib/libwpa_client.so: bin_clear_free: symbol not found
>
> Cc: Martin Bark <martin@barkynet.com>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Reviewed-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
