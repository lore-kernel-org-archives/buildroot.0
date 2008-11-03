From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Nov 2008 00:17:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
 toolchaintoolchain/external-toolchain
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com>
References: <20081103101839.6021A3C915@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com>
Message-ID: <20081104001754.5fb48c87@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 3 Nov 2008 16:09:10 -0500,
"hartleys" <hartleys@visionengravers.com> a ?crit :

> With these two patches I can no longer build kernel 2.6.27.3 using an
> external 4.1.1-920t toolchain.

Oops. Could you give me your Buildroot .config file ? And the error
message you're having ?

To build the kernel, there are two solutions:
 * linux (advanced configuration)
 * linux (same version as linux headers)

The second solution is probably broken by my change, but the first one
seems to work fine here.

I don't use Buildroot to build my kernels, so I missed that problem,
sorry.

> I know I should just build a new toolchain with buildroot but I have
> never been able to successfully get one working. That step I just do
> not get.....

I also use external toolchain, since I have troubles getting a
completely working toolchain with Buildroot.

> Removing the following two patches fixes the problem. Any other
> solution?

I understand why removing the second chunk fixes something, but not
really the first chunk.

Thanks for the feedback !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
