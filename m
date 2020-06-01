From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:15:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: fix -fno-common build
 failure
In-Reply-To: <20200517213426.12315-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Sun, 17 May 2020 23:34:26 +0200")
References: <20200517213426.12315-1-heiko.thiery@gmail.com>
Message-ID: <871rmyh7a0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Added upstream patch for fixing build failure when using GCC10 as a host
 > compiler (-fno-common is now default).

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
