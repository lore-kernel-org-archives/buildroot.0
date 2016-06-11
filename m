From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:20:17 +0200
Subject: [Buildroot] [PATCH 1/1] linux: align endiness based on BR config
In-Reply-To: <1463663823-7308-1-git-send-email-oferh@marvell.com>
References: <1463663823-7308-1-git-send-email-oferh@marvell.com>
Message-ID: <20160611162017.25f96a13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 16:17:03 +0300, oferh at marvell.com wrote:
> From: Ofer Heifetz <oferh@marvell.com>
> 
> Linux endiness should be based on BR2_ENDIAN,
> this commit alignes linux endian with BR.
> 
> Signed-off-by: Ofer Heifetz <oferh@marvell.com>
> ---
>  linux/linux.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied to master with a few minor tweaks (endiness -> endianness,
added a comment in the .mk file, etc.).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
