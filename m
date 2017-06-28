From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:25:07 +0200
Subject: [Buildroot] [PATCH] mosquitto: add upstream security fix
In-Reply-To: <20170628104420.28572-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 28 Jun 2017 12:44:20 +0200")
References: <20170628104420.28572-1-peter@korsgaard.com>
Message-ID: <87lgoberf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-9868: In Mosquitto through 1.4.12, mosquitto.db (aka the
 > persistence file) is world readable, which allows local users to obtain
 > sensitive MQTT topic information.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
