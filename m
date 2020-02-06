From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Feb 2020 11:50:14 +0100
Subject: [Buildroot] [PATCH 1/6 v2] linux: license files hashes are only
 valid for latest known version
In-Reply-To: <78725a1b4fbf938bd5c3540f519009d8939d2ae2.1580914115.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 5 Feb 2020 15:48:38 +0100")
References: <cover.1580914115.git.yann.morin.1998@free.fr>
 <78725a1b4fbf938bd5c3540f519009d8939d2ae2.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <87d0asuh09.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Markus Mayer <mmayer@broadcom.com>
 > The content of COPYING changed between v4.16 and v4.17. Since kernels
 > before and after the change are supported, storing the hash for this
 > file will cause an error during "make legal-info" when a kernel with the
 > respective other hash is being used.

 > So, for the kernel, we do like we did for ATF: the license file is only
 > listed for the latest version.

 > In the process, add the missing license files referenced from COPYING
 > and align the fields to the newly spacing convention.

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
 > [yann.morin.1998 at free.fr:
 >   - only list the licenses files for the latest version
 >   - restore the hash for COPYING
 >   - introduce hashes for the two new license files
 >   - expand commit log accordingly
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
