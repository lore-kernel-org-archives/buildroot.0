From: Ed Spiridonov <edo.rus@gmail.com>
Date: Fri, 15 May 2020 20:30:05 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <20200511223108.4184-1-edo.rus@gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
Message-ID: <CACm0Nn1Fs9KfqWvEMSVXgCXePOViXXBW1TfNziL_56hvzWfs_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 12, 2020 at 1:31 AM Ed Spiridonov <edo.rus@gmail.com> wrote:
>
> Since 2.4 version, OpenVPN can be built using mbeb TLS as it's
> crypto backend, instead of OpenSSL.
>
> About 2 Mb of uncompressed image size can be saved by replacing
> OpenSSL with mbed TLS.

Is anybody interested in this patch?
I'm going to publish another patch to make some features optional
(server side, multihome, etc), but I guess it will be ignored like
this one.
