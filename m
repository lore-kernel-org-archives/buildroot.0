From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jul 2016 11:56:01 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-protobuf: Allow
 generating host-python-protobuf
In-Reply-To: <1467291218-7710-1-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1467291218-7710-1-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <e6b56a17-ab1c-37ea-46ff-4e4a70aa662c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tiago,

Le 30/06/2016 ? 14:53, Tiago Brusamarello a ?crit :
> This change allows use of python-protobuf libraries on the host, so
> 'protoc-gen-lua' plugin for the 'protoc' tool can be run on host.

Thanks for the improved commit log.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
> ---
>  package/python-protobuf/python-protobuf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> index d8be76d..b328e3e 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -14,3 +14,4 @@ PYTHON_PROTOBUF_SETUP_TYPE = setuptools
>  PYTHON_PROTOBUF_SUBDIR = python
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> 
