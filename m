From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 23:18:02 +0200
Subject: [Buildroot] [PATCH v3] Buildroot' patch to add support for
 aarch64 in mplayer configure script
In-Reply-To: <e6993588b5107e1110e43ed583416f4784933eef.1442336078.git.jpinto@synopsys.com>
References: <e6993588b5107e1110e43ed583416f4784933eef.1442336078.git.jpinto@synopsys.com>
Message-ID: <20150915231802.1e19b09c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joao,

Your e-mail is two patches concataned to each other. Can you make that
a single patch instead?

Also, the title should be adjusted, as I explained in a previous
message. See some more comments below.

On Tue, 15 Sep 2015 18:00:48 +0100, jpinto wrote:
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> Tested-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  package/mplayer/0007-enable-aarch64.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/mplayer/0007-enable-aarch64.patch
> 
> diff --git a/package/mplayer/0007-enable-aarch64.patch b/package/mplayer/0007-enable-aarch64.patch
> new file mode 100644
> index 0000000..7f75756
> --- /dev/null
> +++ b/package/mplayer/0007-enable-aarch64.patch
> @@ -0,0 +1,13 @@

All patches in Buildroot should have a description and a Signed-off-by
line. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
for details.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
