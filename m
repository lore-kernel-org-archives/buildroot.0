From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 23:05:23 +0100
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <20190204165557.2160-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 4 Feb 2019 17:55:57 +0100")
References: <20190204165557.2160-1-peter@korsgaard.com>
Message-ID: <87k1idki1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Build for x86-64 as public containers in general are only available for
 > x86-64.  Docker needs a number of kernel options enabled, so use a custom
 > kernel config based on the qemu one.

 > Docker needs entropy at startup, so enable the virtio-rng-pci device to
 > expose entropy to the guest.  The default RAM amount (128M) is not enough to
 > run docker / docker-compose, so bump to 512MB.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
