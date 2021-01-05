From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 22:52:38 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/rpm: don't set openmp
In-Reply-To: <20201203173710.540004-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Dec 2020 18:37:10 +0100")
References: <20201203173710.540004-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1mz59w9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't set openmp to fix a build failure with codesourcery toolchain that
 > doesn't have OpenMP >= 4.5 indeed upstream doesn't want to remove the
 > build failure if the user provides --enable-openmp and OpenMP is < 4.5:
 > https://github.com/rpm-software-management/rpm/pull/1433

 > Fixes:
 >  - http://autobuild.buildroot.org/results/05dd945d24e8684aad6a2343ba7f6f8a7cea8349

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Don't set openmp instead of disabling it

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
