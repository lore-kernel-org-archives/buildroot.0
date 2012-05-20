From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 May 2012 14:37:16 +0200
Subject: [Buildroot] [PATCH v4 09/22] manual: add advice about GPL
 compliance for Buildroot
In-Reply-To: <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
Message-ID: <4FB8E57C.20008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/12 19:33, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
> ---
>   docs/manual/using.txt |   27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/docs/manual/using.txt b/docs/manual/using.txt
> index 42d4061..fcbd24b 100644
> --- a/docs/manual/using.txt
> +++ b/docs/manual/using.txt
> @@ -284,3 +284,30 @@ Buildroot, with the name used in the manifest file:
>   * +BSD-2c+: BSD 2-clause license;
>   * +PROPRIETARY+: marks a non-opensource package;
>     Buildroot does not save any licensing info or source code for these packages.
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
> +consult your legal department or lawyer in case of any doubt.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
