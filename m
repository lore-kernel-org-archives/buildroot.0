From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 08:29:10 +0100
Subject: [Buildroot] [PATCH v2 4/7] tpm2-abrmd: do not enforce
 -fstack-protector-all
In-Reply-To: <20190115101522.21042-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 15 Jan 2019 11:15:19 +0100")
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-4-peter@korsgaard.com>
Message-ID: <87bm45b3g9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Stack protection is now controlled Buildroot wide with the BR2_SSP_*
 > options, so disable the explicit -fstack-protector-all so the SSP logic in
 > the toolchain wrapper is used instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x after adjusting the variable names for v1.3.0,
thanks.

-- 
Bye, Peter Korsgaard
