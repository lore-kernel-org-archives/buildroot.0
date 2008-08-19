From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 19 Aug 2008 07:56:08 +0200
Subject: [Buildroot] Patch files with Makefile.autotools.in
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19096D931D@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19096D931D@mi8nycmail19.Mi8.com>
Message-ID: <20080819075608.54c5d9c7@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Aug 2008 12:42:41 -0400
"hartleys" <hartleys@visionengravers.com> wrote:

> Hello all,
> 
> Does anything have to be added to a FOO.mk file to get patches in the
> FOO directory applied?
> 

No, but the patch name should preferably be on the form:
<package name>-<version>-<something descriptive>.patch {.gz,.bz2}

See the stamp_patched rule in package/Makefile.autotools.in

-- 
Best regards,
Hans-Christian Egtvedt
