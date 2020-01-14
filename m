From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 21:20:37 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version
 to 42ec119
In-Reply-To: <20200114181920.54b8bd3e@gmx.net>
References: <20200114094256.23174-1-ps.report@gmx.net>
 <20200114094256.23174-3-ps.report@gmx.net>
 <trinity-41871925-7822-4238-98ae-909b71ee05a8-1579005943320@3c-app-mailcom-bs09>
 <20200114152755.4123935c@gmx.net> <20200114181920.54b8bd3e@gmx.net>
Message-ID: <20200114212037.2982bca7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jan 2020 18:19:20 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - BR2_aarch64:
> 
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libbcm_host.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libcontainers.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdebug_sym_static.a
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libdtovl.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libfdt.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_components.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_core.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_util.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libmmal_vc_client.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchiq_arm.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvchostif.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcos.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/libvcsm.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_asf.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_avi.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_binary.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_flv.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_metadata_id3.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mkv.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mp4.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_mpga.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_ps.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_qsynth.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_raw_video.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rcv.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rtp.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rtsp.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_rv9.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_simple.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/reader_wav.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_asf.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_avi.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_binary.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_dummy.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_mp4.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_raw_video.so
> build/rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6/build/lib/writer_simple.so

The question is: what are those libraries useful for? Which packages are using them?

For OpenGL, EGL, OpenMAX, etc. it's pretty clear: they implement the
standard Khronos APIs. But none of these are available in the AArch64
version. So, what is using these libraries ?

I also noticed that libfdt.so is part of these libraries (for both the
ARM and AArch64 version): I hope it is not installed as it would
conflict/overwrite the libfdt library installed by the dtc package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
