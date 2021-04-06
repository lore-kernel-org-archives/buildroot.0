From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 22:38:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: security bump to
 v2.0.10
In-Reply-To: <20210406111613.253507-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Tue, 6 Apr 2021 13:16:13 +0200")
References: <20210406111613.253507-1-titouanchristophe@gmail.com>
Message-ID: <87k0pfdu8m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > Versions 2.0.10 of Mosquitto has been released. This is a security and bugfix release.
 > CVE-xxxx-xxxx: If an authenticated client connected with MQTT v5 sent a malformed
 > CONNACK message to the broker a NULL pointer dereference occurred, most likely
 > resulting in a segfault. This will be updated with the CVE number when it is assigned.
 > Affects versions 2.0.0 to 2.0.9 inclusive.

 > See the announcement: https://mosquitto.org/blog/2021/04/version-2-0-10-released/

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
