From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:56:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/zstd: avoid compilation during
 host-zstd install step
In-Reply-To: <20200928114228.23637-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 28 Sep 2020 13:42:26 +0200")
References: <20200928114228.23637-1-patrickdepinguin@gmail.com>
Message-ID: <87wo090zx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The host-zstd-build step was not actually compiling the library:

 > make[1]: Entering directory '/buildroot/output/build/host-zstd-1.4.5/lib'
 > make[1]: Nothing to be done for 'default'.
 > make[1]: Leaving directory '/buildroot/output/build/host-zstd-1.4.5/lib'

 > and the actual compilation was part of the install step.
 > This is not how other Buildroot packages work.

 > Make sure to specify which library targets we want instead. The total amount
 > of compiled files does not change with this patch.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
