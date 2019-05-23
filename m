From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 23 May 2019 15:07:13 +0800
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <20190509230324.0b03746e@windsurf.home>
References: <20190509060042.1026E872A2@whitealder.osuosl.org>
 <20190509230324.0b03746e@windsurf.home>
Message-ID: <20190523070713.GA28472@app09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas, all

sorry I miss this message.
On Fri, May 10, 2019 at 05:03:24AM +0800, Thomas Petazzoni wrote:
> Hello,
> 
> -rc1 has been released, let's try to resume my traditional effort of
> analyzing the build failures, and bring attention to some of them.
> 
> Julien, Louis-Paul, Nylon, Romain, Vadim, Adam, Peter, Bernd, please
> see below: there are some questions for you! :-)
> 
> On Thu, 09 May 2019 06:00:37 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> >          arm |                    atftp-0.7.2 | NOK | http://autobuild.buildroot.net/results/8606908b60fca430366d558a8e6db7a06ca08631 |     
> >          arc |                    atftp-0.7.2 | NOK | http://autobuild.buildroot.net/results/177a64fb419a6d4c2349970bce966819925e4de5 |     
> 
> These were download issues on my build server due to an old wget. They
> are fixed once the tarball is cached on sources.buildroot.net.
> 
> >         m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/e96cacd185f14479433f91ccd47d76058cf5b345 |     
> 
> Fixed by https://git.buildroot.org/buildroot/commit/?id=81fa9080c18d8f3f6278a874d1df2746f081ce5f.
> 
> >          sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/2fd595b1bd0be42b0e302cf4e6d958a64cb20244 |     
> >         i686 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b14a16e695ab38d2b30ff801b43dc44ece1efc71 |     
> >         i586 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b31cb312953065de9c8ac36c27aa3260b0872721 |     
> >       mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/695c9775d2fe69ef64b87d8196b097c5ba4995c4 |     
> >       xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/6cc427b80e8a9abb7850df0a782545fd552d6ee8 |     
> 
> I have submitted http://patchwork.ozlabs.org/patch/1097677/ to fix this.
> 
> >          arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b72ded5e1fb56ca197386472f24d776a52954bac | ORPH
> >       x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0ce9055a6db721b211639b2105ba2f1430b6f5a7 | ORPH
> >       x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e92d094e401ffef33f26ba6d10cfbc830befbfe8 | ORPH
> >      powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/27bb494c0cc6672a1f5578857d5e8b52a2d5f7be | ORPH
> >         i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7ed74b6183acc34dc5406a6801b01d05b38778d2 | ORPH
> >   aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4232294a3d0c2d52e01f590918c2873e987e876c | ORPH
> >          arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/22357f7ec97d19b7bae58dc65c172bd8f49e0e70 | ORPH
> >       x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/44c93bc8a9d982a55bdb747cfc5b084881b3b86a | ORPH
> >          arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4bf68114d8fb6c7b10558f08eff17a2d6cc74156 | ORPH
> >      riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7d57931d110011ce9ca5c2cb2192e5ce3e4a37f9 | ORPH
> >          arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/02241fe5e6585fdb922557df65141dce47aec99d | ORPH
> >    powerpc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/befa1070dffc928ce5a56b392ca0f5ecce3d28b7 | ORPH
> >          arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6006a70a00e48745c0de372187f1bef28d70de3f | ORPH
> >          arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/cb0ca725aa66d661cfe63168432c626f663f4d44 | ORPH
> >      powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bebccc77513aafe07a1e3ee80a36c082ff1b7256 | ORPH
> 
> Fixed by
> https://git.buildroot.org/buildroot/commit/?id=9798ea7cfb8a5d222e5939860ba3adcf0292126b.
> 
> >       xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4f460ff42739e3c8277baf50880139aefd169cfa |     
> 
> We still have this regular timeout, almost always on Julien Boibessot's
> machine. Julien, do you have any idea what's going on ?
> 
> >       x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/c4725517fbca4d113a09935c90f6389e85743c08 |     
> 
> Louis-Paul, you added this package, it seems to fail building with the
> musl C library. Could you have a look ?
> 
> >      nds32le |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/85af2b037f2b3277a572302acf113c9e11d0223b |     
> 
> ../lib/liblib.a(parser.o): in function `read_double_func':
> parser.c:(.text+0x734): undefined reference to `__fpclassify'
> 
> This feels like a toolchain issue. Nylon, could you have a look ?
> 
Actually this is keepalived's configure.ac bug

I issued a problem to the keepalived's Github
https://github.com/acassen/keepalived/issues/1258

And then keepalived's developer has been solved
https://github.com/acassen/keepalived/commit/dea6cfba122439b29cdcb833a59868dd51a4eae4

I pull this commit into my Buildroot,and running "make keepalived" getting build passed
> >         m68k |     libtorrent-rasterbar-1.2.1 | NOK | http://autobuild.buildroot.net/results/98008526d4b269140dae2462acb77478c79e3ca0 |     
> 
> disk_io_thread.cpp: In member function 'void libtorrent::disk_io_thread::abort(bool)':
> disk_io_thread.cpp:315:2: internal compiler error: in connect_traces, at dwarf2cfi.c:2802
> 
> Romain, you are familiar with many of the compiler bugs that we have on
> weird architectures. Does this one ring any bell ?
> 
> > microblazeel |                lynx-2.8.9rel.1 | NOK | http://autobuild.buildroot.net/results/23a421e15c32b17ff2f69f183a2e8620ecb93316 |     
> 
> libiconv issue. According to
> http://autobuild.buildroot.net/?reason=lynx% it only happens once in a
> while. Vadim, you looked at a lot of libiconv/libintl issues, perhaps
> you will have an idea ?
> 
> >    powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/eeb2863c6237aac8428e49a5ee514d43088b0fb8 |     
> >       x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/f938fd1515f1d6e11b57aa6e314135789da52a44 |     
> >          arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ca4f61a4aba114b04fcf12f66b6266f78807aab8 |     
> >         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e48416d9ee659dbe9ee3115c4005b2587f08fbe0 |     
> 
> I submitted
> http://patchwork.ozlabs.org/project/buildroot/list/?series=107046 to
> fix both the timeouts and build failures, even though the fixes are
> quite fragile...
> 
> >      sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/47b604d67556087289461d54f6b54f67a41d4b09 |    
> 
> Some java.nio.file.NoSuchFileException. Adam, it seems to only occur on
> sparc64. Could you confirm that ? If it's the case, perhaps we should
> simply drop sparc64 support in openjdk ?
> 
> >      aarch64 |            python-numpy-1.16.3 | NOK | http://autobuild.buildroot.net/results/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d |     
> 
> /home/buildroot/autobuild/run/instance-2/output/host/bin/aarch64-linux-gnu-gcc /tmp/tmph865w02v/tmp/tmph865w02v/source.o -L/home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lcblas -o /tmp/tmph865w02v/a.out
> /home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcblas.so: undefined reference to `scnrm2_'
> /home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcblas.so: undefined reference to `scasum_'
> collect2: error: ld returned 1 exit status
> /home/buildroot/autobuild/run/instance-2/output/host/bin/aarch64-linux-gnu-gcc /tmp/tmph865w02v/tmp/tmph865w02v/source.o -L/home/buildroot/autobuild/run/instance-2/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -lblas -o /tmp/tmph865w02v/a.out
> /tmp/tmph865w02v/tmp/tmph865w02v/source.o: In function `main':
> /tmp/tmph865w02v/source.c:6: undefined reference to `cblas_ddot'
> collect2: error: ld returned 1 exit status
> 
> I'm not sure what's going on here. Sadly, Samuel who was maintaining
> python-numpy, is no longer active in Buildroot. Is there anyone else
> volunteering to have a look ?
> 
> >       x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/d3fa9fa6d897ac120e716d2e114e0706ac62fae7 |     
> 
> global/qfloat16_f16c.c:57:6: error: redefinition of 'void qFloatToFloat16_fast(quint16*, const float*, qsizetype)'
>  void qFloatToFloat16_fast(quint16 *out, const float *in, qsizetype len) Q_DECL_NOTHROW
>       ^~~~~~~~~~~~~~~~~~~~
> 
> Peter (Seiderer), any idea ?
> 
> >      powerpc |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/11790cad7dab795d50b53d44750c838a86039d1f |     
> 
> qgstreamerplayersession.cpp:400:44: error: cannot convert 'GValue* {aka _GValue*}' to 'void**' for argument '2' to 'GstIteratorResult gst_iterator_next(GstIterator*, void**)'
>          while (gst_iterator_next (it, &data) == GST_ITERATOR_OK) {
> 
> GStreamer/Qt compatibility issue. Peter (Seiderer), again ? :-)
> 
> >     mips64el |                   samba4-4.9.7 | NOK | http://autobuild.buildroot.net/results/28b9caf2e03ff79e32220c7289d34bb8c303abdf |     
> 
> /home/peko/autobuild/instance-0/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
>  typedef unsigned long int uintptr_t;
>                            ^
> In file included from ../source3/registry/tests/test_regfio.c:23:0:
> ../third_party/cmocka/cmocka.h:126:28: note: previous declaration of 'uintptr_t' was here
>        typedef unsigned int uintptr_t;
> 
> Bernd, you are taking care of Samba, could you have a look ?
> 
> >         i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/b04da43e67b246cf3c4b2805b8cf6cf0c90197a9 |     
> 
> gsm0610_rpe.c:132:5: error: invalid 'asm': invalid constraints for operand
>      __asm__ __volatile__(
>      ^~~~~~~
> 
> Bernd, spandsp is also one of your packages, could you have a look ?
> 
> >         m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/c036b11bf1f2fc39f42661634ef3e03360fb85de |     
> 
> Baruch is proposing http://patchwork.ozlabs.org/patch/1097490/ to avoid
> this build issue.
> 
> >      powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/d9e53484b6114a6b6271eb1c40c32ddc9fec6fb3 |     
> 
> This should be fixed by http://patchwork.ozlabs.org/project/buildroot/list/?series=104482.
> 
> >      aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/355a4314aa8f36631119841b83f15abe3f8e14ce |     
> 
> I need to revive an old patch from Fabrice to fix this one.
> 
> >      powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/09464861add139bd4048398029f54d75539385b8 | ORPH
> 
> Toolchain issue ? Romain, any idea ?
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
