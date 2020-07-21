From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:50:45 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: delete debug libs when debug
 is not enabled
In-Reply-To: <20200714022554.2045-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Mon, 13 Jul 2020 22:25:54 -0400")
References: <20200714022554.2045-1-danomimanchego123@gmail.com>
Message-ID: <874kq0mw2i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Some toolchains, like the Linaro gcc7 toolchains, now install libstdc++ debug
 > library symbols to /lib/debug, which can be as large as the library itself.
 > This commit removes the extra debug content if debugging is not enabled.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
