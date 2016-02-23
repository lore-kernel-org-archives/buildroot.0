From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:50:24 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 09/11]
 python-pyparsing: Add host build option
In-Reply-To: <1455603506-26138-9-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-9-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223225024.7b8956b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 11:48:24 +0530, Niranjan Reddy wrote:

> diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
> index ad066b8..c8f304b 100644
> --- a/package/python-pyparsing/python-pyparsing.mk
> +++ b/package/python-pyparsing/python-pyparsing.mk
> @@ -12,3 +12,4 @@ PYTHON_PYPARSING_LICENSE_FILES = LICENSE
>  PYTHON_PYPARSING_SETUP_TYPE = distutils
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))

What is using this new host-python-pyparsing package? Your latest two
patches 10 and 11 are not making use of it, and I couldn't spot this
being used in the previous patches either (and if it was used in the
previous patches, then it would be another ordering issue in your patch
series).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
