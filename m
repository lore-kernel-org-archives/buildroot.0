From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 26 Jul 2016 09:30:43 +0200
Subject: [Buildroot] [PATCH v2 3/6] docs/manual: Document the variable
 $(PKG)_DL_OPTS
In-Reply-To: <20160715160054.GE3692@free.fr>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-4-git-send-email-romain.perier@free-electrons.com>
 <20160715160054.GE3692@free.fr>
Message-ID: <579711A3.6090808@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 15/07/2016 18:00, Yann E. MORIN a ?crit :
>
> With the last sentence, I'd also say something like:
>
>      All download methods valid for +LIBFOO_SITE_METHOD+ are supported;
>      valid options depend on the download method (consult the man page
>      for the respective download utilities).
>
> Regards,
> Yann E. MORIN.
>
>>   * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
>>     files that Buildroot should download. If an entry contains +://+
>>     then Buildroot will assume it is a complete URL and will download
>> --
>> 2.8.1

Ack, I will fix this.

Thanks!

-- 
Romain Perier, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
