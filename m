From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 2 Apr 2018 13:01:32 +0000
Subject: [Buildroot] Fwd: [PATCH] hackrf: new package
In-Reply-To: <4717c3cb-2c10-5e7b-bc3a-3e36dcc963e4@mind.be>
References: <20180331205758.9652-1-arnout@mind.be>
 <4717c3cb-2c10-5e7b-bc3a-3e36dcc963e4@mind.be>
Message-ID: <1522674091.3989.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, 2018-03-31 at 23:05 +0200, Arnout Vandecappelle wrote:
>  Hi Alexey,
> 
>  Sorry, I forgot to put you in Cc.
> 
>  Regards,
>  Arnout
> 
> 
> -------- Forwarded Message --------
> Subject: [PATCH] hackrf: new package
> Date: Sat, 31 Mar 2018 22:57:58 +0200
> From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> To: buildroot at buildroot.org
> CC: Jason Pruitt <jrspruitt@gmail.com>, Arnout Vandecappelle <arnout@mind.be>
> 
> From: Jason Pruitt <jrspruitt@gmail.com>
> 
> This patch adds hackrf/host tools for HackRF, a low cost, open source
> Software Defined Radio platform.
> 
> Sources of host tools are available on GitHub here:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_mossmann_hackrf_tree_master_host&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=OtZvQ4lNHIbjtyy
> sXrNW8RbX6WFkigcev-xByzJ_fLk&m=3fPnQrE4rSy5zQsDX4KiuyrN0_yo_bx7cMjSZbnpQ9Y&s=JvoE14lAkMAbq6U9--tXF7zDwrs3YxMuCP2i7XieViA&e=
> 
> Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> [Arnout:
>  - Rename package to hackrf to match upstream name;
>  - Reorder dependencies and remove empty line (check-package);
>  - Use only sha256 hash;
>  - Add hash for license file;
>  - Bump to 2018.01.1;
>  - Use uploaded tarball rather than github-generated one;
>  - Fix dependencies of comment (|| instead of &&)
>  - Add UDEV_RULES_GROUP=plugdev in case the build host doesn't have
>    this group;
>  - Add patch fixing build without C++ compiler.
> ]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: Changes by Arnout, see above
> 
> Alexey and/or Jason, can you re-test with this version?

I made a quick build test and it's all OK.
Unfortunately I don't have access to HackRF hardware ATM so
cannot run-test it.

Thanks for taking care of this one.

-Alexey
