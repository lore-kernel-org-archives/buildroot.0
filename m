From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 16:51:34 +0100
Subject: [Buildroot] [PATCH] package/openssh: adding a way to install
 only sftp-server
In-Reply-To: <20190215231725.07f05798@windsurf.home> (Thomas Petazzoni's
 message of "Fri, 15 Feb 2019 23:17:25 +0100")
References: <20190215220257.12430-1-angelo@amarulasolutions.com>
 <20190215231725.07f05798@windsurf.home>
Message-ID: <87k1hxayd5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Angelo,
 > On Fri, 15 Feb 2019 23:02:57 +0100
 > Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

 >> This patch adds a way to install only sftp-server in case it is
 >> needed by other packages (like dropbear) or a full openssh installation is
 >> not needed.

 > Why not using package/gesftpserver/ if you need a sftp server in a
 > dropbear-only environment ?

Yes, my thoughts exactly!

-- 
Bye, Peter Korsgaard
