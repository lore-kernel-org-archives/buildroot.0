From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:09:38 +0200
Subject: [Buildroot] [PATCH v2] package/openrc: enable support when
 libselinux is selected
In-Reply-To: <20200416032137.721705-1-unixmania@gmail.com>
References: <20200416032137.721705-1-unixmania@gmail.com>
Message-ID: <20200417220938.03410bbc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 00:21:37 -0300
unixmania at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> OpenRC suports SELinux, so there is no reason to forcibly disable it.
> 
> Notice this only allows OpenRC to perform the initial policy load and
> set the enforcing mode. In order really use SELinux it's also necessary
> to select refpolicy, which provides a policy, and policycoreutils, which
> provides restorecon and other SELinux utilities.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Tested-by: Carlos Santos <unixmania@gmail.com>
> ---
> Tested on QEMU, with ext4fs, selecting refpolicy and policycoreutils.
> Only disabled and permissive modes were used, since the enforcing mode
> currently does not work. See the help text in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
