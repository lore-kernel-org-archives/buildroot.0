From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 12 Sep 2020 10:03:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: security bump to
 version 0.9.5
In-Reply-To: <20200911210306.617737-1-fontaine.fabrice@gmail.com>
References: <20200911210306.617737-1-fontaine.fabrice@gmail.com>
Message-ID: <CAEyMn7bDBn_0mWfbWXRmE16+CO5UwMTQ+jxt8Dqzk7sxiF3kSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Fabrice,

Am Fr., 11. Sept. 2020 um 23:03 Uhr schrieb Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> - Drop patches (already in version)
> - Fix CVE-2020-16135: libssh 0.9.4 has a NULL pointer dereference in
>   tftpserver.c if ssh_buffer_new returns NULL.
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
