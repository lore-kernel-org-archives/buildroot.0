From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 30 Jan 2019 13:29:08 +0800
Subject: [Buildroot] Building host-python-2.7.15 Failed
In-Reply-To: <20190127205547.224c1eae@windsurf.home>
References: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
 <8017d9a3-290f-f8de-8e13-55430ace2b77@mind.be>
 <20190126151022.23c5a011@windsurf>
 <CAAsE_uc6pTbBHu_UgUSSaTyEbyKocPpEcSJK9hgz+UsMBN=QoQ@mail.gmail.com>
 <CAAsE_ucb7QYz1MQcdk8Cf_N9Oni7ZTjQnLZ8tNXZgWpFZKCi3g@mail.gmail.com>
 <20190127205547.224c1eae@windsurf.home>
Message-ID: <CAAsE_ucRYOF3F5K0a3SakEAzwAs7JGnueqCnAeUikyYj+GJ4zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, thanks for your finding.  After I reinstalled the libc-dev, the
compile passed!

On Mon, Jan 28, 2019 at 3:55 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 28 Jan 2019 01:06:29 +0800
> Woody Wu <narkewoody@gmail.com> wrote:
>
> > I checked my ubuntu 18.04.  It has /lib/x86_64-linux-gnu/libcrypt.so.1
> and
> > no libcrypt.so.
>
> It is weird, because libc6-dev should have installed both libcrypt.a
> and libcrypt.so. See
> https://packages.ubuntu.com/cosmic/amd64/libc6-dev/filelist. So it
> should not be possible to have libcrypt.a without libcrypt.so.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
Life is the only flaw in an otherwise perfect nonexistence
    -- Schopenhauer

woody
public key at http://subkeys.pgp.net:11371 (narkewoody at gmail.com)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190130/e26253dd/attachment.html>
