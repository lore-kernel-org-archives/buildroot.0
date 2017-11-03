From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 3 Nov 2017 09:11:26 -0500
Subject: [Buildroot] [PATCH v4 1/1] libsepol: require threads
In-Reply-To: <20171103133306.20198-1-aduskett@gmail.com>
References: <20171103133306.20198-1-aduskett@gmail.com>
Message-ID: <CANQCQpb=yJR8roo3m3Erig0yHAhTfm6s-Ex4v4sA7OMn8f0Tsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Fri, Nov 3, 2017 at 8:33 AM, Adam Duskett <aduskett@gmail.com> wrote:
> libsepol 2.7 now uses pthreads.h
>

Suggest adding link to one of the failures.

    libsepol-2.7 |
http://autobuild.buildroot.net/results/5f1c6872a395d8c6d55e2b1722730871b4daf6a3

I used the above config, changed to buildroot toolchain/glibc/gcc6 and
retested without error.  Also before making that change, menuconfig
looked correct with the comment.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
