From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jan 2019 20:55:47 +0100
Subject: [Buildroot] Building host-python-2.7.15 Failed
In-Reply-To: <CAAsE_ucb7QYz1MQcdk8Cf_N9Oni7ZTjQnLZ8tNXZgWpFZKCi3g@mail.gmail.com>
References: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
 <8017d9a3-290f-f8de-8e13-55430ace2b77@mind.be>
 <20190126151022.23c5a011@windsurf>
 <CAAsE_uc6pTbBHu_UgUSSaTyEbyKocPpEcSJK9hgz+UsMBN=QoQ@mail.gmail.com>
 <CAAsE_ucb7QYz1MQcdk8Cf_N9Oni7ZTjQnLZ8tNXZgWpFZKCi3g@mail.gmail.com>
Message-ID: <20190127205547.224c1eae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Jan 2019 01:06:29 +0800
Woody Wu <narkewoody@gmail.com> wrote:

> I checked my ubuntu 18.04.  It has /lib/x86_64-linux-gnu/libcrypt.so.1 and
> no libcrypt.so.

It is weird, because libc6-dev should have installed both libcrypt.a
and libcrypt.so. See
https://packages.ubuntu.com/cosmic/amd64/libc6-dev/filelist. So it
should not be possible to have libcrypt.a without libcrypt.so.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
