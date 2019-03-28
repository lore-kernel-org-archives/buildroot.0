From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 11:13:44 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/wavemon: remove NPTL
 dependency
In-Reply-To: <20190327175233.6342b03a@windsurf> (Thomas Petazzoni's message of
 "Wed, 27 Mar 2019 17:52:33 +0100")
References: <20190216105027.26055-1-fontaine.fabrice@gmail.com>
 <20190327175233.6342b03a@windsurf>
Message-ID: <87zhpfl31j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 16 Feb 2019 11:50:27 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> wavemon does not use pthread_mutexattr_setrobust since version 0.8.2 and
 >> https://github.com/uoaerg/wavemon/commit/d271685e03bc896829d8cc01ca0de28cd7b6ba72
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/wavemon/Config.in | 6 +++---
 >> 1 file changed, 3 insertions(+), 3 deletions(-)

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
