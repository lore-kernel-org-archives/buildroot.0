From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 23 Aug 2016 10:56:58 +0200
Subject: [Buildroot] [PATCH/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <2d18aa76-85b7-fb92-3540-d0b5d91a925a@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 08/22/2016 11:51 PM, Thomas Petazzoni wrote:
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  DEVELOPERS | 1375 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 1375 insertions(+)
>  create mode 100644 DEVELOPERS

[snip]
> +
> +N:	Julien Boibessot <julien.boibessot@armadeus.com>
> +F:	configs/armadeus*
> +F:	package/libcddb/
> +

I think you can add F: board/armadeus/*

[snip]
> +
> +N:	S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> +F:	package/mmc-utils/
> +F:	package/python-flask-jsonrpc/
> +F:	package/python-flask-login/

Can you add F: confis/armadeus* and F: board/armadeus/* please ?

Thanks !

[snip]

Regards,

-- 
S?bastien Szymanski
Software Engineer
Armadeus Systems - A new vision of the embedded world
sebastien.szymanski at armadeus.com
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
