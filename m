From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:37:15 +0100
Subject: [Buildroot] [PATCH v3,2/2] rygel: new package
In-Reply-To: <20171031083933.19956-2-fontaine.fabrice@gmail.com>
References: <20171031083933.19956-1-fontaine.fabrice@gmail.com>
 <20171031083933.19956-2-fontaine.fabrice@gmail.com>
Message-ID: <20171127223715.1d45e1e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 09:39:33 +0100, Fabrice Fontaine wrote:
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
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Romain Naour and Thomas Petazzoni):
>  - Update version from 0.34 to 0.36
>  - Remove comment on missing COPYING.logo and add it to LICENSE_FILES
>  - Add entry in DEVELOPERS
>  - Fix static build by patching gupnp-av

Applied to next with the following changes:

    [Thomas:
     - use SPDX license codes
     - add hashes for license files
     - move Config.in comment at the end of the Config.in file to not
       break the indentation of the sub-options.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
