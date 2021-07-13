From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jul 2021 23:39:18 +0200
Subject: [Buildroot] [PATCH 2/5] package/libgcrypt: security bump to
 version 1.9.3
In-Reply-To: <20210621054747.218408-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 Jun 2021 07:47:44 +0200")
References: <20210621054747.218408-1-fontaine.fabrice@gmail.com>
 <20210621054747.218408-2-fontaine.fabrice@gmail.com>
Message-ID: <87k0ltx5a1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-33560: Libgcrypt before 1.8.8 and 1.9.x before 1.9.3
 > mishandles ElGamal encryption because it lacks exponent blinding to
 > address a side-channel attack against mpi_powm, and the window size is
 > not chosen appropriately. (There is also an interoperability problem
 > because the selection of the k integer value does not properly consider
 > the differences between basic ElGamal encryption and generalized ElGamal
 > encryption.) This, for example, affects use of ElGamal in OpenPGP.

 > https://dev.gnupg.org/T5305

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
