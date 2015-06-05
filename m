From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 11:43:46 +0200
Subject: [Buildroot] [PATCH 01/12] fs/common: add <fs>_POST_GEN_HOOKS
	support
In-Reply-To: <1433430330-2166-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+CciW03-FuXxjqiGC-mZbL6dJ7QOS92dfO76LDuC558A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The common filesystem infrastructure already supports a
> <fs>_PRE_GEN_HOOKS variable, which allows filesystem makefiles to
> register some actions to be done before the root filesystem image is
> generated.
>
> This commit adds a similiar <fs>_POST_GEN_HOOKS variable, which will
> allow filesystem makefiles to do some actions after the filesystem
> image has been generated. It will initially be used by the iso9660
> filesystem to delete the temporary directory it creates.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
