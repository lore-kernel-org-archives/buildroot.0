From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 10:50:16 +0100
Subject: [Buildroot] [PATCH 2/2] Add hash file
In-Reply-To: <1422855653-6338-2-git-send-email-skenton@ou.edu>
References: <1422855653-6338-1-git-send-email-skenton@ou.edu>
 <1422855653-6338-2-git-send-email-skenton@ou.edu>
Message-ID: <20150202105016.4b24eddf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Mon,  2 Feb 2015 05:40:53 +0000, Steve Kenton wrote:
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
>  package/cdrtools/cdrtools.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/cdrtools/cdrtools.hash

This patch should not be separated from the previous, it should be
merged with it.

> 
> diff --git a/package/cdrtools/cdrtools.hash b/package/cdrtools/cdrtools.hash
> new file mode 100644
> index 0000000..c9f9c29
> --- /dev/null
> +++ b/package/cdrtools/cdrtools.hash
> @@ -0,0 +1,3 @@
> +cdrtools-3.00.tar.gz 	2010-06-02 	2.5 MB 	6363 weekly downloads 	i

This line doesn't make sense in a hash file. There should instead be a
comment saying where the hashes are coming from. Something like:

# From http://sourceforge.net/....

or

# Locally computed

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
