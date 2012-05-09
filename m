From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 May 2012 08:05:57 +0200
Subject: [Buildroot] [PATCH v3 09/22] manual: add advice about GPL
 compliance for Buildroot
In-Reply-To: <1336421563-5986-9-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-9-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAAXf6LW4gPgbo7vh_wZvE7aHHW5EgO84-fte4W9QSaLfRa_veg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 7, 2012 at 10:12 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> ?docs/manual/using.txt | ? 27 +++++++++++++++++++++++++++
> ?1 files changed, 27 insertions(+), 0 deletions(-)
>
> diff --git a/docs/manual/using.txt b/docs/manual/using.txt
> index 09f4136..411136b 100644
> --- a/docs/manual/using.txt
> +++ b/docs/manual/using.txt
> @@ -281,3 +281,30 @@ Buildroot, with the name used in the manifest file:
> ?* +BSD-4c+: Original BSD 4-clause license;
> ?* +BSD-3c+: BSD 3-clause license;
> ?* +BSD-2c+: BSD 2-clause license.
> +
> +Complying with the Buildroot license
> +------------------------------------
> +
> +Buildroot itself is an opensource software, released under the
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
> +License, version 2] or (at your option) any later version.
> +However, being a build system, it is not normally part of the end product:
> +if you develop the root filesystem, kernel, bootloader or toolchain for a
> +device, the code of Buildroot is only present on the development machine, not
> +in the device storage.
> +
> +Nevertheless, the general view of the Buildroot developers is that you should
> +release the Buildroot source code along with the source code of other packages
> +when releasing a product that contains GPL-licensed software.
> +This is because the
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU GPL]
> +defines the "'complete source code'" for an executable work as "'all the
> +source code for all modules it contains, plus any associated interface
> +definition files, plus the scripts used to control compilation and installation
> +of the executable'".
> +Buildroot is part of the 'scripts used to control compilation and
> +installation of the executable', and as such it is considered part of the
> +material that must be redistributed.
> +
> +Keep in mind this is only the Buildroot developers' opinion, and you should
> +consult your legal department or lawyer for any doubt.

I'm not a native English speaker myself, but I would have written 'in
case of any doubt' instead of 'for any doubt'.
