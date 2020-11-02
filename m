From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 2 Nov 2020 20:47:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: bump to version 3.4.0
In-Reply-To: <20201102194306.GB41334@pevik>
References: <20201101163057.1944742-1-fontaine.fabrice@gmail.com>
 <20201102194306.GB41334@pevik>
Message-ID: <CAPi7W81js5YTDezCVv1XAJEUchYTEkRBkbQx8Ou6S7z2jO_A0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

Le lun. 2 nov. 2020 ? 20:43, Petr Vorel <petr.vorel@gmail.com> a ?crit :
>
> Actually, c-ares are required since v3.3.0
> (commit 451a241e50 Add c-ares to the required library list.)
>
> You still keep it as optional dependency, thus by default build fails.
Thanks for spotting this mistake, I'll send a v2.
>
> Kind regards,
> Petr
Best Regards,

Fabrice
