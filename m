From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 May 2012 22:56:29 +0200
Subject: [Buildroot] [PATCH v4 09/22] manual: add advice about GPL
 compliance for Buildroot
In-Reply-To: <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAAXf6LXW_mqgqv8h2-sWHn9H4VByBNtCHLnRwqhZY-+q-77TMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 17 mei 2012 19:35 schreef "Luca Ceresoli" <luca@lucaceresoli.net> het
volgende:
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  docs/manual/using.txt |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/docs/manual/using.txt b/docs/manual/using.txt
> index 42d4061..fcbd24b 100644
> --- a/docs/manual/using.txt
> +++ b/docs/manual/using.txt
> @@ -284,3 +284,30 @@ Buildroot, with the name used in the manifest file:
>  * +BSD-2c+: BSD 2-clause license;
>  * +PROPRIETARY+: marks a non-opensource package;
>   Buildroot does not save any licensing info or source code for these
packages.
> +
> +Complying with the Buildroot license
> +------------------------------------
> +
> +Buildroot itself is an opensource software, released under the
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
> +License, version 2] or (at your option) any later version.
> +However, being a build system, it is not normally part of the end
product:
> +if you develop the root filesystem, kernel, bootloader or toolchain for a
> +device, the code of Buildroot is only present on the development
machine, not
> +in the device storage.
> +
> +Nevertheless, the general view of the Buildroot developers is that you
should
> +release the Buildroot source code along with the source code of other
packages
> +when releasing a product that contains GPL-licensed software.
> +This is because the
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU GPL]
> +defines the "'complete source code'" for an executable work as "'all the
> +source code for all modules it contains, plus any associated interface
> +definition files, plus the scripts used to control compilation and
installation
> +of the executable'".
> +Buildroot is part of the 'scripts used to control compilation and
> +installation of the executable', and as such it is considered part of the
> +material that must be redistributed.
> +
> +Keep in mind this is only the Buildroot developers' opinion, and you
should
> +consult your legal department or lawyer in case of any doubt.

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120517/f7dbf5b7/attachment.html>
