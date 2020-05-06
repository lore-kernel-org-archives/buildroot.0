From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:52:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: fix build on m68k
In-Reply-To: <20200419225038.1be1de14@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 19 Apr 2020 22:50:38 +0200")
References: <20191101111005.21389-1-fontaine.fabrice@gmail.com>
 <20200419225038.1be1de14@windsurf.home>
Message-ID: <875zd9d300.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri,  1 Nov 2019 12:10:05 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> When threads are enabled, haproxy expects that pthread_getcpuclockid is
 >> available which is not the case on m68k. Fix this by enabling threads
 >> support only if NPTL is available.
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/52cc4b1fcac2a4fc84ab15ec4c692d2cd9b6d8bd
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/haproxy/haproxy.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
