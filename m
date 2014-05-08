From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 May 2014 11:57:40 +0000 (UTC)
Subject: [Buildroot] [Bug 7010] jamvm builds and runs fine under mips (be)
In-Reply-To: <bug-7010-163@https.bugs.busybox.net/>
References: <bug-7010-163@https.bugs.busybox.net/>
Message-ID: <20140508115740.D66A69CB31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7010

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Target Milestone|---                         |2014.05

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-05-08 11:57:40 UTC ---
Feedback from jamvm main developer:

"In the past JamVM only worked with GNU Classpath, and I made regular
releases to tie in with that.  However, since 2010, JamVM development
has mainly focused on OpenJDK support.  The IcedTea project (which
packages JamVM and OpenJDK) does not rely on releases as they
periodically take a snapshot from git.

"Having said that, I have since discovered that IcedTea would also
prefer to work with "official" releases.  So I do want to go back to a
release model.  I have just finished OpenJDK 8 support so now seems a
good time to do a release.  There have also been many bugs fixed, and
tightening of standards compliancy which will also affect GNU
Classpath.  However, before I do a release I have to test with Mauve
(GNU Classpath test suite).  I mostly run with OpenJDK now, so I need
to ensure that the OpenJDK work hasn't broken anything with GNU
Classpath.  My intention was to do this over the weekend, so hopefully
if no problems show up there should be a new release in a couple of
days."

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
