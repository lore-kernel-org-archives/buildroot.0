From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 23:24:47 +0100
Subject: [Buildroot] [PATCH 2/2] linux: only depend on host-lzop if
	needed
In-Reply-To: <20140128232019.6136bcaf@skate> (Thomas Petazzoni's message of
 "Tue, 28 Jan 2014 23:20:19 +0100")
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <1d22a1ff0f39a4b4e8fe4186cf9696a44a01e20f.1390744549.git.yann.morin.1998@free.fr>
 <20140128231437.22b6a7ee@skate> <87ha8nzr7n.fsf@dell.be.48ers.dk>
 <20140128232019.6136bcaf@skate>
Message-ID: <87d2jbzqvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> So I believe the answer is yes, it will work.

 > Ok, thanks, I missed that. I believe it's a little bit fragile to rely
 > on the assumption that it will not become the default, but since the
 > breakage will be very clear if this ever changes, I think Yann's
 > proposal is a good compromise. I was also annoyed by host-lzop always
 > being built, even if useless. Seemed like Buildroot was turning into
 > this other build system that builds gazillions of useless
 > dependencies :)

Indeed. We do have a problem with the initramfs stuff though as I
pointed out.

-- 
Bye, Peter Korsgaard
