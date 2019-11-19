From: b.bilas at grinn-global.com <b.bilas@grinn-global.com>
Date: Tue, 19 Nov 2019 18:46:29 +0100
Subject: [Buildroot] [next] utils/scanpypi: remind developer about
 updating DEVELOPERS and Config.in
In-Reply-To: <20191119171527.18570-1-matthew.weber@rockwellcollins.com>
References: <20191119171527.18570-1-matthew.weber@rockwellcollins.com>
Message-ID: <736f4d0c1df679a4d95c9e5cc91dcfd4@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On 2019-11-19 18:15, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> utils/scanpypi | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 55b3d1e61c..abb190a536 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -739,6 +739,8 @@ def main():
> package.create_hash_file()
> 
> package.create_config_in()
> +            print("NOTE: Remember to also make an update to the
> DEVELOPERS file")
> +            print("      and include an entry for the pkg in
> packages/Config.in")
> print()
> # printing an empty line for visual confort
> finally:

why wouldn't we do that automatically? ;) We shouldn't have much trouble 
with that.

Best
Bartek
