From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:35:18 +0200
Subject: [Buildroot] [PATCH] mosquitto: security bump to version 1.4.12
In-Reply-To: <20170529211959.8430-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 May 2017 23:19:59 +0200")
References: <20170529211959.8430-1-peter@korsgaard.com>
Message-ID: <87inkfixnd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-7650: Pattern based ACLs can be bypassed by clients that set
 > their username/client id to ?#? or ?+?.  This allows locally or remotely
 > connected clients to access MQTT topics that they do have the rights to.
 > The same issue may be present in third party authentication/access control
 > plugins for Mosquitto.

 > For more details, see:
 > https://mosquitto.org/2017/05/security-advisory-cve-2017-7650/

 > Remove 0001-Remove-lanl-when-WITH_ADNS-is-unset.patch as that patch is now
 > upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
