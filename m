From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 16 Jun 2017 14:14:18 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
Message-ID: <6a986028-02cd-4d47-92a6-14cd74c793dc@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On st?eda 14. ?ervna 2017 9:14:46 CEST, Wolfgang Grandegger wrote:
> I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder 
> why the address sanitizer library "libasan.so*" is not available 
> in the rootfs of the target. Is it intentional? And what is the 
> best way to get it added to the rootfs?

I was hitting the same problem but with GCC 6.3. I "kinda solved it" by 
simply copying the files around; I'm afraid I don't want to dive into GCC's 
makefiles to see why these are getting skipped.

Cheers,
Jan
