From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 11:53:51 +0100
Subject: [Buildroot] [PATCH] rabbitmq-server: security bump to version
	3.6.6
In-Reply-To: <20170113124118.20028-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 13 Jan 2017 13:41:18 +0100")
References: <20170113124118.20028-1-peter@korsgaard.com>
Message-ID: <87mverff7k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a critical authentication vulnerability in the MQTT plugin
 > (CVE-2016-9877):

 > MQTT (MQ Telemetry Transport) connection authentication with a
 > username/password pair succeeds if an existing username is provided but the
 > password is omitted from the connection request.  Connections that use TLS
 > with a client-provided certificate are not affected.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
