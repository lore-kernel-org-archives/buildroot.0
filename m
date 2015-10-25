From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:48:48 +0100
Subject: [Buildroot] [PATCH 2/2] supervisor: fix license
In-Reply-To: <1445598228-6675-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 23 Oct 2015 12:03:48 +0100")
References: <1445598228-6675-1-git-send-email-Vincent.Riera@imgtec.com>
 <1445598228-6675-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87h9lehdxr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/supervisor/supervisor.mk |    3 ++-
 >  1 files changed, 2 insertions(+), 1 deletions(-)

 > diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
 > index d3c250f..5e0fa53 100644
 > --- a/package/supervisor/supervisor.mk
 > +++ b/package/supervisor/supervisor.mk
 > @@ -6,7 +6,8 @@
 
 >  SUPERVISOR_VERSION = 3.1.3
 >  SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
 > -SUPERVISOR_LICENSE_FILES = LICENSES.txt
 > +SUPERVISOR_LICENSE = repoze, BSD based, rdflib (http_client.py), PSF (medusa), ZPL-2.1

We normally call it BSD-like, so I've changed it to that and committed,
thanks.

-- 
Bye, Peter Korsgaard
