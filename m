From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 13:36:41 +0200
Subject: [Buildroot] [PATCH] systemd: add upstream security fix
In-Reply-To: <20170605092733.bpy3fvqazetakp4q@tarshish> (Baruch Siach's
 message of "Mon, 5 Jun 2017 12:27:33 +0300")
References: <d116b87e5aea0bf5820ba5af0e048f89fafa4ee8.1496600674.git.baruch@tkos.co.il>
 <20170605111829.2c0942b4@free-electrons.com>
 <20170605092733.bpy3fvqazetakp4q@tarshish>
Message-ID: <87efuxe4ae.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Thomas,
 > On Mon, Jun 05, 2017 at 11:18:29AM +0200, Thomas Petazzoni wrote:
 >> On Sun,  4 Jun 2017 21:24:34 +0300, Baruch Siach wrote:
 >> > Fixes CVE-2017-9217: remote DoS (daemon crash) via a crafted DNS response with
 >> > an empty question section.
 >> > 
 >> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> > ---
 >> >  package/systemd/systemd.hash | 1 +
 >> >  package/systemd/systemd.mk   | 3 +++
 >> >  2 files changed, 4 insertions(+)
 >> 
 >> Applied to master, thanks. Peter: I guess this should go to the LTS
 >> branch. Baruch, can you confirm it applies to the systemd version we
 >> have in the LTS branch?

 > Cherry-pick of systemd commit a924f43f30f9c applies cleanly to systemd v232 
 > that we have in the LTS branch. I didn't build/test though.

Thanks, committed to 2017.05.x and 2017.02.x after doing a build test.

-- 
Bye, Peter Korsgaard
