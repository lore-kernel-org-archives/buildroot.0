From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:14:05 +0100
Subject: [Buildroot] [PATCH] package/qt5tools: hide qdoc with llvm
 dependencies
In-Reply-To: <25605_1582898461_5E591D1D_25605_345_8_0fa6a8d4-31d0-445b-acea-f425422d14ef@OPEXCAUBMA2.corporate.adroot.infra.ftgroup>
 (yann morin's message of "Fri, 28 Feb 2020 15:00:54 +0100")
References: <25605_1582898461_5E591D1D_25605_345_8_0fa6a8d4-31d0-445b-acea-f425422d14ef@OPEXCAUBMA2.corporate.adroot.infra.ftgroup>
Message-ID: <87d09ue76a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Building qdoc requires a llvm and clang for the host.

 > However, there is a limitation in the llvm and clang packages in
 > Buildroot, which makes it impossible to havea  host variant without
 > a target variant.

 > So, propagate the dependencies of the target llvm and clang, to ensure
 > we can only have a host-llvm and -clang packages that are correctly
 > built.

 > Note that we do propagate all of the dependencies (instead of just the
 > architecture part), to be consistent.

 > Reported-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Seiderer <ps.report@gmx.net>
 > Cc: Julien Corjon <corjon.j@ecagroup.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
