From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:19:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: update to 2.0.18
In-Reply-To: <20190313083557.13418-1-adrien@gallouet.fr> ("Adrien
 =?utf-8?Q?Gallou=C3=ABt=22's?=
 message of "Wed, 13 Mar 2019 08:35:58 +0000")
References: <20190313083557.13418-1-adrien@gallouet.fr>
Message-ID: <874l7qlnad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrien" == Adrien Gallou?t <adrien@gallouet.fr> writes:

 > This release fixes the following issue with new kernels:
 > kexec --load bzImage --reuse-cmdline
 > Unhandled rela relocation: R_X86_64_PLT32

 > Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
