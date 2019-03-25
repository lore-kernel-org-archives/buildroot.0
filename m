From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:31:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tss: rename tpm2-tss
 libraries in the help text
In-Reply-To: <20190308132710.11116-1-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 8 Mar 2019 14:27:09 +0100")
References: <20190308132710.11116-1-romain.naour@smile.fr>
Message-ID: <87lg12ncfi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Since tpm2-tss version 2.0.0, tpm2 libraries have been renamed.
 > libsapi renamed to libtss2-sys
 > https://github.com/tpm2-software/tpm2-tss/commit/5f0ab55d4e46077cb8f0c53a76c5ebd15a088d26

 > libtcti-device renamed to libtss2-tcti-device
 > libtcti-socket renamed to libtss2-tcti-mssim
 > https://github.com/tpm2-software/tpm2-tss/commit/b8584accbd96e38eaea250e31ed3ea580d2bca27

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Carlos Santos <casantos@datacom.com.br>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
