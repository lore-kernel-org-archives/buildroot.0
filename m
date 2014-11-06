From: Milton Soares Filho <milton.soares.filho@gmail.com>
Date: Wed, 5 Nov 2014 23:06:40 -0200
Subject: [Buildroot] Buildroot and apt-get
In-Reply-To: <CAEk40fwsed9DmOPs-Pcp0txYvaS2_tzaHHBuWD9QsxrtBXd-QQ@mail.gmail.com>
References: <CAEk40fyze1gZL_x52zfESUqLzTMsjAUdmEKPVYL7DZJ2=3D1vQ@mail.gmail.com>
 <20141105081824.01c2698a@free-electrons.com>
 <CAEk40fwsed9DmOPs-Pcp0txYvaS2_tzaHHBuWD9QsxrtBXd-QQ@mail.gmail.com>
Message-ID: <CAPNngRN73aKSdDBN9wYfKeXL_jtNh_q1Fgps7eU9Q4r=1RbGuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a package called rpi-userland which may enable what you need[1]

Just issue the command to build it or enable it at the menuconfig options.

    make rpi-userland

As Thomas has said, after finishing the build the tools will be
available at the target filesystem and images.

[]s, milton

[1]: https://github.com/raspberrypi/userland/blob/master/host_applications/linux/apps/raspicam/README.md
