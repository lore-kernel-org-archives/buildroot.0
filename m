From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 10:48:53 +0200
Subject: [Buildroot] [PATCH] package/mosquitto: bump version to 1.6.5
In-Reply-To: <20190916073201.4260-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 16 Sep 2019 09:32:01 +0200")
References: <20190916073201.4260-1-peter@korsgaard.com>
Message-ID: <87blv78mtm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfix release, fixing a number of issues:
 > - Fix v5 DISCONNECT packets with remaining length == 2 being treated as a
 >   protocol error.  Closes #1367.
 > - Fix support for libwebsockets 3.x (excluding 3.2.0)
 > - Fix slow websockets performance when sending large messages.  Closes
 >   #1390.
 > - Fix bridges potentially not connecting on Windows.  Closes #478.
 > - Fix clients authorised using use_identity_as_username or
 >   use_subject_as_username being disconnected on SIGHUP.  Closes #1402.
 > - Improve error messages in some situations when clients disconnect.
 >   Reduces the number of "Socket error on client X, disconnecting" messages.
 > - Fix Will for v5 clients not being sent if will delay interval was greater
 >   than the session expiry interval.  Closes #1401.
 > - Fix CRL file not being reloaded on HUP.  Closes #35.
 > - Fix repeated "Error in poll" messages on Windows when only websockets
 >   listeners are defined.  Closes #1391.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
