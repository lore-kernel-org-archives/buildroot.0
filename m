From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 24 Apr 2019 12:38:19 -0500
Subject: [Buildroot] Linux arch default cfgs and fragments
Message-ID: <CANQCQpZ3fyxSBbvkPURYj9LSYUKe7H9av+qvEwA3jvRFRrphaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wanted to open the debate on the topic of using arch defconfigs and
the negatives of where fragments may over time or between target
kernel minor revisions have different end results because of the arch
defconfig default state.

I'm wondering if when a arch defconfig is used the fragments against
it should be validated as actually being in the final expanded
config....  I see the merge config script has support to validate this
but by default it isn't part of the process.

Thoughts?

-- 
Matthew Weber | Pr. Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
Tel: +1 319 295 7349 | FAX: +1 319 263 6099
matthew.weber at collins.com | collinsaerospace.com
