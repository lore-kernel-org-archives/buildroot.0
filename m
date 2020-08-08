From: Christian Stewart <christian@paral.in>
Date: Sat, 8 Aug 2020 10:55:30 -0700
Subject: [Buildroot] [PATCH v2 2/6] package/linux4tegra: new package
In-Reply-To: <CALFsTFV1bqm00_-PCXCrneKonKBvuqbn4DMsDCLk2x17f-cMXQ@mail.gmail.com>
References: <20200808123918.1880533-1-christian@paral.in>
 <20200808123918.1880533-2-christian@paral.in>
 <CALFsTFV1bqm00_-PCXCrneKonKBvuqbn4DMsDCLk2x17f-cMXQ@mail.gmail.com>
Message-ID: <CA+h8R2rM=q5UehNNfoD7CEA60uXvX+V68o0Cj5aWjynbujgjXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

On Sat, Aug 8, 2020 at 7:03 AM Asaf Kahlon <asafka7@gmail.com> wrote:
> On Sat, Aug 8, 2020 at 3:39 PM Christian Stewart <christian@paral.in> wrote:
> >
> > NVIDIA Linux4Tegra utilities and binaries.
> >
> > https://developer.nvidia.com/embedded/linux-tegra-archive
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> >
> > v1 -> v2:
> >
> >  - cjs: add license hashes
> >

[snip]

> > diff --git a/package/linux4tegra/linux4tegra.hash b/package/linux4tegra/linux4tegra.hash
> > new file mode 100644
> > index 0000000000..3af19ddeaa
> > --- /dev/null
> > +++ b/package/linux4tegra/linux4tegra.hash
> > @@ -0,0 +1,54 @@
> > +# locally computed
> > +sha256 9a2d13b1f4b67fef97a428d54724b23e84e14636eedfa22f338c2d1ea62558e2  Tegra186_Linux_R32.4.3_aarch64.tbz2
> > +sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  bootloader/LICENSE
> > +sha256 496f3bc5456694cce764d28a93565bb0d0967dbd95256759e4168a9587406949  bootloader/LICENSE.adsp
> > +sha256 q4885fa44934935d6a178c84a16aec49dae1bd4f41f14bbbd781bafcf704885f  bootloader/LICENSE.bpmp
> I'm pretty sure the letter 'q' can't be a part of a sha256 checksum :)

Yes... oops... FWIW I set up some CI just now to automatically run
check-package before I submit.

Now it's:

sha256 d4885fa44934935d6a178c84a16aec49dae1bd4f41f14bbbd781bafcf704885f
 bootloader/LICENSE.bpmp

Not sure why this didn't fail during the test build I ran?

Best regards,
Christian
