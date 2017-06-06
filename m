From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 23:28:18 +0200
Subject: [Buildroot] [PATCH 1/1] imx-uuc: fix start-stop-daemon stop
	failure
In-Reply-To: <20170606230211.6e853d36@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 6 Jun 2017 23:02:11 +0200")
References: <1496266845-11307-1-git-send-email-alexandre.esse.dev@gmail.com>
 <20170606230211.6e853d36@free-electrons.com>
Message-ID: <87lgp4bybx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 31 May 2017 23:40:45 +0200, Alexandre Esse wrote:
 >> The daemon service script associated with imx-uuc failed to stop the daemon 
 >> since the PID of the process wasn't stored at start time.
 >> 
 >> Adding -m option allowed to create the uuc.pid file as expected.
 >> 
 >> Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
 >> ---
 >> package/freescale-imx/imx-uuc/S80imx-uuc | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks. Peter: this should go in the LTS branch.

Indeed. Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
