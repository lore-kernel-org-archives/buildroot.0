From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:19:05 +0100
Subject: [Buildroot] [PATCH v4 1/3] ustream-ssl: new package
In-Reply-To: <1476702145-25280-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1476702145-25280-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <20161105141905.65f4e812@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 16:32:23 +0530, Rahul Jain wrote:
> ustream-ssl has support for polarssl and cyassl
> but since polarssl is made obsolete by mbedtls and cyassl
> is not present in buildroot, we have not added support for it.
> 
> Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
> Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
> ---
>  Changes v3 -> v4:
>    - add USTREAM_SSL_LICENSE_FILES variable
>  Changes v2 -> v3:
>    - Remove entry from DEVELOPERS file
>  Changes v1 -> v2:
>    - No changes

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
