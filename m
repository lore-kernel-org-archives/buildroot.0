From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 20:26:46 +0100
Subject: [Buildroot] [PATCH] package/libssh2: security bump to latest git
In-Reply-To: <CANQCQpbUNbvyO=EMEKBS5Z4zXGguGx3FoQohaJ1Bnt938_m4cQ@mail.gmail.com>
 (Matthew Weber's message of "Mon, 25 Mar 2019 12:33:57 -0500")
References: <20190320211859.18155-1-peter@korsgaard.com>
 <253e0999-90aa-778a-c247-1926d48d5475@mind.be>
 <CANQCQpbUNbvyO=EMEKBS5Z4zXGguGx3FoQohaJ1Bnt938_m4cQ@mail.gmail.com>
Message-ID: <87ef6ulpqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Arnout / Peter,
 > On Wed, Mar 20, 2019 at 6:02 PM Arnout Vandecappelle <arnout@mind.be> wrote:
 >> 
 >> 
 >> 
 >> On 20/03/2019 22:18, Peter Korsgaard wrote:
 >> > Bump the version to latest git to fix the following security issues:

 > I didn't check the version details but wondered if we were based off
 > of 1.8.x or latest?  I noticed they just dropped a 1.8.1 last week and
 > a 1.9 is pending
 > (https://www.libssh2.org/mail/libssh2-devel-archive-2019-03/0023.shtml).

We were using a post-1.8.x git commit for a number of fixes, so going
back to 1.8.1 would have reverted those.

-- 
Bye, Peter Korsgaard
