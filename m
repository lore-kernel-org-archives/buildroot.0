From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 29 Jan 2019 09:47:11 -0600
Subject: [Buildroot] [PATCH v3 2/5] testing/infra/basetest: support
 br2-external
In-Reply-To: <20190128232209.17485-3-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
 <20190128232209.17485-3-aduskett@gmail.com>
Message-ID: <CANQCQpb9_gpFeOXFVu_AEgfDKVbg1U7jrCVii44wh1A+RWJK5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jan 28, 2019 at 5:22 PM <aduskett@gmail.com> wrote:
>
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>
> Some upcoming test cases can use one or more br2-external trees as fixtures
> that provide packages used only in runtime tests.
>
> Add support for br2-external into the BRTest class. Any test case can
> then provide a list of paths for being used as br2-external trees during
> the build of the image to test.

Both this patch and http://patchwork.ozlabs.org/patch/1032309/ would
be nice to have merged as they allow more complex test scenarios to be
built for runtime testing. The patches are independent of the couple
patchsets that have used them.

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
