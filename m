From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 16:58:12 +0100
Subject: [Buildroot] [PATCH v5 1/1] gstreamer1-mm: new package
In-Reply-To: <20171204142658.29519-1-aduskett@gmail.com>
References: <20171204142658.29519-1-aduskett@gmail.com>
Message-ID: <20171214165812.7c3635db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Dec 2017 09:26:58 -0500, Adam Duskett wrote:
> Gstreamermm provides C++ bindings for gstreamer.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Changed the name of the package from gst1-mm to gstreamer1-mm (Arnout)
>   - Added upstream author information to the patches (Arnout)
>   - Changed the upstream repo from github to git.gnome.org (Arnout)
>   - Added myself to the DEVELOPERS file.
>   - Added --enable-unittests=no to the mk file, as the default is auto.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
