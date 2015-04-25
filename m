From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:49:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fixes linking error with
 tremor due to wrong library name
In-Reply-To: <1429740384-21839-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429740384-21839-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425114904.20e960ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 23 Apr 2015 00:06:24 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/469/4693f5f3d362e74a55c8145dbe777606f5865ad5/
> http://autobuild.buildroot.net/results/795/795744533dbf7076e88163fb35327da8c42819f1/
> http://autobuild.buildroot.net/results/89d/89d9997fc76ad334ff7b7f2a28294c78c424a120/
> http://autobuild.buildroot.net/results/57f/57f22c8623268d836e8b402e8c27d418b6fb7f72/
> http://autobuild.buildroot.net/results/5f6/5f66a8a135c95624a14908c685f1201dd7f8ae87/
> 
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0004-libvorbisidec.patch |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/vlc/0004-libvorbisidec.patch

I've renamed to 0005-libvorbisidec.patch, so that the patch numbering
remains correct, and applied.

Please submit upstream.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
