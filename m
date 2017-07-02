From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 15:35:53 +0200
Subject: [Buildroot] [git commit] mosquitto: add upstream security fix
In-Reply-To: <20170628212845.85EC781F11@busybox.osuosl.org> (Peter Korsgaard's
 message of "Wed, 28 Jun 2017 23:25:02 +0200")
References: <20170628212845.85EC781F11@busybox.osuosl.org>
Message-ID: <87vanbarly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e51d69a3b11ae971d2aa65d6d0a6f0bb7730e0ab
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes CVE-2017-9868: In Mosquitto through 1.4.12, mosquitto.db (aka the
 > persistence file) is world readable, which allows local users to obtain
 > sensitive MQTT topic information.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
