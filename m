From: Worth, Kevin <kevin.worth@hp.com>
Date: Wed, 20 Mar 2013 22:27:08 +0000
Subject: [Buildroot] [PATCH] Fix external toolchain gdbserver copy path
 for using buildroot-generated toolchain
In-Reply-To: <20130320215447.0d7c272f@skate>
References: <B5EF724456FFB24A8C8AE88E26CE8F4B6D7EAEA9@G9W0753.americas.hpqcorp.net>
 <20130320215447.0d7c272f@skate>
Message-ID: <B5EF724456FFB24A8C8AE88E26CE8F4B6D7F0889@G9W0753.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks- I figured I could at least offer some approach to fix it, even if it wasn't ideal. :)
This approach saves me a lot of time not having to rebuild toolchains, and is relatively easy to manage.

-Kevin Worth
