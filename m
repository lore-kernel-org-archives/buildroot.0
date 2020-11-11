From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 10:13:34 +0100
Subject: [Buildroot] [PATCH] support/testing: update to the new text
 representation of capabilities
In-Reply-To: <20201110222901.1289515-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 10 Nov 2020 23:29:01 +0100")
References: <20201110222901.1289515-1-romain.naour@gmail.com>
Message-ID: <87h7pwmf29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Since libcap 2.41, the text representation of capabilities now use
 > the '=' instead of '+' [1].

 > This break our capabilities tests since we still use the old
 > representation.

 > [1] https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=177cd418031b1acfcf73fe3b1af9f3279828681c

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed after adding the fixes line, thanks.

-- 
Bye, Peter Korsgaard
