From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Nov 2008 20:22:44 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
	toolchaintoolchain/external-toolchain
In-Reply-To: <20081104182314.580215e5@surf> (Thomas Petazzoni's message of
	"Tue\, 4 Nov 2008 18\:23\:14 +0100")
References: <20081103101839.6021A3C915@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com>
	<20081104001754.5fb48c87@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909C9177C@mi8nycmail19.Mi8.com>
	<20081104182314.580215e5@surf>
Message-ID: <873ai71ekb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> The second option ? same version as linux headers ? clearly
 Thomas> cannot work with my patches: since we're using an external
 Thomas> toolchain, there's no version of linux headers defined in
 Thomas> Buildroot.

 Thomas> So my proposal is:

 Thomas>  1) remove the option "linux (same version as linux headers)"
 Thomas>  when an external toolchain is used ;

Seems logical.

 Thomas> Grant Likely recently sent a patch adding the ability to get the kernel
 Thomas> for a Git repository. See
 Thomas> http://buildroot.uclibc.org/lists/buildroot/2008-October/011037.html.
 Thomas> This patch hasn't been integrated to Buildroot, yet.

Yeah, it's still on my todo list.

-- 
Bye, Peter Korsgaard
