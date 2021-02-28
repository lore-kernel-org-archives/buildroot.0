From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Feb 2021 17:15:37 +0100
Subject: [Buildroot] [PATCH 2020.11.x] package/i7z: fix build with gcc 10
In-Reply-To: <20210220183553.10627-1-vincent.stehle@laposte.net> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Sat, 20 Feb 2021 19:35:53 +0100")
References: <20210220183553.10627-1-vincent.stehle@laposte.net>
Message-ID: <87tupwqic6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? <vincent.stehle@laposte.net> writes:

 > From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Fixes:
 > - http://autobuild.buildroot.org/results/1a433611ba8676cf1ca276fccaf3633971bd562e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [cherry pick commit dbe6870a4c9b to fix
 > http://autobuild.buildroot.net/results/72ca4e447655e1dda5d201301b6916b47be2dc71]
 > Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 > ---


 > Hi,

 > I would like to propose backporting this patch from Fabrice Fontaine to the
 > 2020.11.x branch, please. This would make the autobuild happy.

Agreed, I must have missed it by accident. Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
