From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:42:47 +0100
Subject: [Buildroot] [PATCH] package/go: enable ARMv7 optimizations for
 ARMv8 target
In-Reply-To: <X3HdjcFKH15Mqu_8q7IQiKQqLChMVl-uUSRXfHc1VvjSCI24ZVvsEOGrvR913T_RgeGoFMNBUla3_y_4H6syUMNdPpubATsMeeRqP4fHSkY=@baudi.no>
 (Michael Baudino's message of "Fri, 18 Dec 2020 10:00:23 +0000")
References: <X3HdjcFKH15Mqu_8q7IQiKQqLChMVl-uUSRXfHc1VvjSCI24ZVvsEOGrvR913T_RgeGoFMNBUla3_y_4H6syUMNdPpubATsMeeRqP4fHSkY=@baudi.no>
Message-ID: <871rfim89k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Baudino <michael@baudi.no> writes:

 > Go doesn't support ARMv8 optimizations yet (see this GitHub
 > issue: https://github.com/golang/go/issues/29373) but can still
 > benefit from ARMv7 optimizations.

 > A comment is left in `go.mk` to mention this and avoid any
 > confusion when reading "ifeq ARMv8 ? GOARM = 7".

 > Signed-off-by: Michael Baudino <michael@baudi.no>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
