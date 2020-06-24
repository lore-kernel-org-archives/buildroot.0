From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Jun 2020 20:55:19 +0200
Subject: [Buildroot] [PATCH] package/wireguard-tools: bump version to
 1.0.20200513
In-Reply-To: <20200624165950.GC20645@scaer> (Yann E. MORIN's message of "Wed, 
 24 Jun 2020 18:59:50 +0200")
References: <20200624055525.13352-1-peter@korsgaard.com>
 <20200624165950.GC20645@scaer>
Message-ID: <87sgek70q0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2020-06-24 07:55 +0200, Peter Korsgaard spake thusly:
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks.

 > I wonder on much hand-in-hand tools and linux-compat need to be in sync,
 > though.... Probably not much, I guess, as tools are also supposed to
 > work on a wide range of kernels, now that wireguard has been upstreamed,
 > right?

Indeed, there shouldn't be any hard version dependency between them,
which is also why they are now split up in two different repos /
released at different moments.

-- 
Bye, Peter Korsgaard
