From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 14:57:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.9.3
In-Reply-To: <20191127125245.30093-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Wed, 27 Nov 2019 13:52:45 +0100")
References: <20191127125245.30093-1-jubalh@iodoru.org>
Message-ID: <874kyhmrz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 >   * PLAIN mechanism is used only when no other mechanisms are supported
 >   * Legacy authentication is disabled by default, can be enabled with
 >     connection flag XMPP_CONN_FLAG_LEGACY_AUTH
 >   * Session is not established if it is optional
 >   * Fixed a bug causing a reused connection not to cleanup properly
 >   * Improved debug logging in OpenSSL module
 >   * Few memory leaks fixed

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
