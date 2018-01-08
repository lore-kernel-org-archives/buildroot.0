From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:47:36 +0100
Subject: [Buildroot] [PATCH v2] libiio: fix libavahi-client dependency
In-Reply-To: <20171227123555.15388-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Wed, 27 Dec 2017 13:35:55 +0100")
References: <20171227123555.15388-1-marcus.folkesson@gmail.com>
Message-ID: <877essqayv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Folkesson <marcus.folkesson@gmail.com> writes:

 > Avahi needs avahi-daemon and D-Bus to build avahi-client.
 > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
 > ---
 > v2:
 > - Do not check for AVAHI as it is implicity checked by
 >   AVAHI_DAEMON

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
