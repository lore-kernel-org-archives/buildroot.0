From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:35:51 +0100
Subject: [Buildroot] [PATCH 1/3] package/mongoose: fix activation of
 openssl/mbedtls
In-Reply-To: <20210216080756.1635858-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 16 Feb 2021 09:07:54 +0100")
References: <20210216080756.1635858-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg5v9560.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > MG_ENABLE_SSL and MG_SSL_IF have been dropped since version 7.0 and
 > https://github.com/cesanta/mongoose/commit/f2fba1d2004c5ddf2fc0a7ca8dc75b5f78feed85

 > So use the new MG_ENABLE_OPENSSL and MG_ENABLE_MBEDTLS variables

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
