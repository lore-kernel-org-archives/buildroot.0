From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 5 Feb 2019 16:08:18 -0600
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <87k1idki1o.fsf@dell.be.48ers.dk>
References: <20190204165557.2160-1-peter@korsgaard.com>
 <87k1idki1o.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpY-Z5Qhto3ZhAKNj2ajzBms7ioegBQZVZ-_YX1QEdRR7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, Feb 5, 2019 at 4:05 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
>  > Build for x86-64 as public containers in general are only available for
>  > x86-64.  Docker needs a number of kernel options enabled, so use a custom
>  > kernel config based on the qemu one.
>
>  > Docker needs entropy at startup, so enable the virtio-rng-pci device to
>  > expose entropy to the guest.  The default RAM amount (128M) is not enough to
>  > run docker / docker-compose, so bump to 512MB.
>
>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> Committed, thanks.

It's great to have a reference test case for docker!
