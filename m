From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 6 Oct 2019 17:56:49 +0200
Subject: [Buildroot] [PATCH v2] package/ripgrep: new package
In-Reply-To: <20191003003146.942555-1-sam.voss@gmail.com>
References: <20191003003146.942555-1-sam.voss@gmail.com>
Message-ID: <20191006155649.GD5258@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2019-10-02 19:31, sam.voss at gmail.com wrote:
> From: Sam Voss <sam.voss@gmail.com>
>
> Signed-off-by: Sam Voss <sam.voss@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fix depends-on values
>   - Add hash for license files
>   - Make indentation consistant

A bit late, but LGTM. In my own version [1], I added
'--jobs=$(PARALLEL_JOBS)' to $(RIPGREP_CARGO_OPTS), but in the end, it
seems useless.

Now that there is one package using Cargo in Buildroot, should the
pkg-cargo infrastructure be added?

[1] https://github.com/elebihan/br2-ext-rust/tree/master/package/ripgrep

Regards,

--
ELB
