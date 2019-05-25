From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sat, 25 May 2019 13:52:27 +0200
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/gpsd: bump to version 3.18.1
In-Reply-To: <20190524135745.8823-1-fontaine.fabrice@gmail.com>
References: <20190524135745.8823-1-fontaine.fabrice@gmail.com>
Message-ID: <CA+sos7_98x11EzSDV4Pep_1yfqVYANW18gSOHj-p254Ocsps=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Fri, May 24, 2019 at 3:57 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Remove second patch (already in version)
> - Add a patch to fix build without man pages
> - Add a patch to remove C99-style loop
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Beno?t Th?baudeau):
>  - Add second patch to fix C99-style loop

[...]

Good.

I also see that BR2_PACKAGE_GPSD_MAX_CLIENT and
BR2_PACKAGE_GPSD_MAX_DEV are broken because limited_max_clients and
limited_max_devices have been renamed in 3.12 as max_clients and
max_devices, respectively.

There is also a skytraq protocol that is supported and that could be
added to the config.

Best regards,
Beno?t
