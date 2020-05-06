From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:04:24 +0200
Subject: [Buildroot] [PATCH] package/libssh: add patch to fix regression
In-Reply-To: <20200421084650.11391-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Tue, 21 Apr 2020 10:46:51 +0200")
References: <20200421084650.11391-1-heiko.thiery@gmail.com>
Message-ID: <87zhalfycn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > The libssh server is used by libnetconf2. With libssh version 0.9.4 a
 > regression was introduced that wrongly leads to session closed after the
 > poll timeout.

 > The patch comes from upstrem:
 > https://git.libssh.org/projects/libssh.git/commit/?id=6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
