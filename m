From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:45:16 +0200
Subject: [Buildroot] [PATCH v2,2/2] rygel: new package
In-Reply-To: <1490387931-113759-2-git-send-email-fontaine.fabrice@gmail.com>
References: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
 <1490387931-113759-2-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20171022144516.12c61e8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 21:38:51 +0100, Fabrice Fontaine wrote:
> Rygel is a home media solution (UPnP AV MediaServer) that allows you to
> easily share audio, video and pictures to other devices.
> 
> Additionally, media player software may use Rygel to become a
> MediaRenderer that may be controlled remotely by a UPnP or DLNA
> Controller.
> 
> Rygel achieves interoperability with other devices in the market by
> trying to conform to the very strict requirements of DLNA and by
> converting media on-the-fly to formats that client devices can handle.
> 
> Most Rygel functionality is implemented through a plug-in mechanism.
> 
> https://wiki.gnome.org/Projects/Rygel
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The patch generally looks good, however Romain Naour reported a build
failure in static linking configurations when the patch is applied, so
we need this to get resolved before applying the patch. Could you
investigate this static linking failure?

While you're at it, you should add yourself in the DEVELOPERS file for
this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
