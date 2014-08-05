From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 09:46:14 +0200
Subject: [Buildroot] [PATCH 2/2] mongoose: patch to avoid
 _LARGEFILE_SOURCE redefinition warning
In-Reply-To: <1407187903-10013-2-git-send-email-zinosat@tiscali.it>
References: <1407187903-10013-1-git-send-email-zinosat@tiscali.it>
 <1407187903-10013-2-git-send-email-zinosat@tiscali.it>
Message-ID: <20140805094614.749f8ced@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Mon,  4 Aug 2014 23:31:43 +0200, Davide Viti wrote:
> 
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
>  package/mongoose/largefile-conditional-define.patch |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/mongoose/largefile-conditional-define.patch
> 
> diff --git a/package/mongoose/largefile-conditional-define.patch b/package/mongoose/largefile-conditional-define.patch
> new file mode 100644
> index 0000000..4fbaa04
> --- /dev/null
> +++ b/package/mongoose/largefile-conditional-define.patch

The file name of the patch does not follow the Buildroot convention
(see the Buildroot manual for details), and lacks a description +
Signed-off-by line.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
