From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 8 Mar 2017 22:43:00 +0530
Subject: [Buildroot]  libglu config error, while X.Org enabled
Message-ID: <CAD6G_RTkov1OJatw14LDVTNodndDav5JSeqgPF0FajGKg=4J7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Any idea about below error while configuring libglu

Log:
----
checking dynamic linker characteristics... (cached) GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether make supports nested variables... (cached) yes
checking pkg-config is at least version 0.9.0... yes
checking for GL... no
checking GL/gl.h usability... no
checking GL/gl.h presence... no
checking for GL/gl.h... no
configure: error: GL not found
make: *** [/workspace/buildroot/output/build/libglu-9.0.0/.stamp_configured]
Error 1

I did see this when I enable X.org X Window System, I've mesa3d, Qt5.8 enabled.
and even host have required packages installed.

sudo apt-get install libgl1-mesa-dev
sudo apt-get install libopenal-dev
sudo apt-get install libsdl-mixer1.2-dev
sudo apt-get install libsdl-net1.2-dev

Please let me know for any help?

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
