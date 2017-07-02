From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 13:43:04 +0200
Subject: [Buildroot] [PATCH] mosquitto: specify that hash is taken from
	upstream
In-Reply-To: <20170701174554.1315e5a6@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 1 Jul 2017 17:45:54 +0200")
References: <20170628105553.32339-1-Vincent.Riera@imgtec.com>
 <20170701174554.1315e5a6@windsurf.home>
Message-ID: <878tk7cbef.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 28 Jun 2017 11:55:53 +0100, Vicente Olivert Riera wrote:
 >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 >> ---
 >> package/mosquitto/mosquitto.hash | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks.

This is not completely correct as the
mosquitto-1.4.x_cve-2017-9868.patch hash is locally computed. I'll push
a patch fixing that.

-- 
Bye, Peter Korsgaard
