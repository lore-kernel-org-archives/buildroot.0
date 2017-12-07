From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Dec 2017 22:08:58 +0100
Subject: [Buildroot] [PATCH 2/2] linux-headers: bump 4.{4, 9,
 14}.x series
In-Reply-To: <dj9jfexdr8.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Tue, 05 Dec 2017 20:45:17 +0100")
References: <1512476325-2566-1-git-send-email-fabio.estevam@nxp.com>
 <1512476325-2566-2-git-send-email-fabio.estevam@nxp.com>
 <dj9jfexdr8.ln2@ID-313208.user.individual.net>
Message-ID: <87r2s6455h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Tue, 05 Dec 2017 10:18:45 -0200 schrieb Fabio Estevam:
 >> From: Fabio Estevam <festevam@gmail.com>
 >> 
 >> Signed-off-by: Fabio Estevam
 >> <festevam@gmail.com>

 > Hi,

 > these kernels fix CVE-2017-1000405, please change the subject to 
 > "security bump 4.{4, 9, 14}.x series" so the patches can be picked more 
 > easily for master and LTS branches, thanks.

Thanks. Linux bumps are likely to fix important / security related
issues in general, so I normally always cherry pick them to lts/current.

-- 
Bye, Peter Korsgaard
