From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 23:34:24 +0200
Subject: [Buildroot] [PATCH 2/2] .gitlab-ci.yml: do runtime tests only
 on explicit trigger
In-Reply-To: <20181021100303.18431-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 21 Oct 2018 11:03:03 +0100")
References: <20181021100303.18431-1-arnout@mind.be>
 <20181021100303.18431-2-arnout@mind.be>
Message-ID: <87h8hf3rxb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > When the runtime tests were first introduced, they still ran pretty
 > quickly. Nowadays, however, there are a lot of runtime tests, and some
 > of them take a really long time. So running them on every push is
 > really too much.

 > Just like we do for the defconfigs, run them on explicit trigger only.

 > The explicit trigger is now done every week, but it can be increased
 > to e.g. twice or three times per week.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > v2: properly regenerate .gitlab-ci.yml


Committed, thanks.

-- 
Bye, Peter Korsgaard
