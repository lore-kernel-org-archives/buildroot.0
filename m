From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 09:10:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-04-11
In-Reply-To: <CAFOYHZC23wcnW0-y=fyiP2x6M2B5CEyFEzJDeWJq_Pw5BuRbkg@mail.gmail.com>
 (Chris Packham's message of "Mon, 12 Apr 2021 20:37:46 +1200")
References: <6073d64f.1c69fb81.9d11e.7f35SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZC23wcnW0-y=fyiP2x6M2B5CEyFEzJDeWJq_Pw5BuRbkg@mail.gmail.com>
Message-ID: <87v98arg93.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > On Mon, Apr 12, 2021 at 5:10 PM Thomas Petazzoni
 > <thomas.petazzoni@bootlin.com> wrote:
 >> 
 >> Hello,
 >> 
 >> Packages having CVEs
 >> ====================
 >> 
 >> This is the list of packages for which a known CVE is affecting them,
 >> which means a security vulnerability exists for those packages.
 >> 
 >> CVEs for the 'master' branch
 >> ----------------------------
 >> 
 >> name              |       CVE        |                             link
 >> -------------------------------+------------------+--------------------------------------------------------------
 >> syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110
 >> 

 > I've managed to get the CVE updated to say "This flaw affects
 > syslog-ng versions prior to and including 2.0.9"[1] but I'm still
 > getting these notifications. Is there something else that needs to
 > happen now? Actually nist[2] seems to know it's been modified so it
 > may be a case of hurry up and wait.

 > [1] - https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-5110
 > [2] - https://nvd.nist.gov/vuln/detail/CVE-2008-5110

Sorry for the slow response. I still don't see any update of this in the
CVE database, E.G. it still lists all syslog-ng versions (
cpe:2.3:a:oneidentity:syslog-ng:-:*:*:*:*:*:*:*). Looking at the changes
(https://nvd.nist.gov/vuln/detail/CVE-2008-5110#VulnChangeHistorySection),
it seems that only the textual description got updated, not the matching
data?

-- 
Bye, Peter Korsgaard
