From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 20 Dec 2012 14:36:00 +1300
Subject: [Buildroot] Can a single package fetch multiple sources?
Message-ID: <CAE21AQoobzHfXRiNDWK7mBLFbbeTU_+bw3ZioAF4wja0QOECXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

I am setting up a custom package for building the proprietary
application code that is added to an embedded Linux system. Due in
part to the history of this system, the package needs code fetched
from 3 svn repositories, followed by a config step and a make step.

From what I have read it seems that a single package can only fetch
from one repository. Is that correct?

If so, then the only way around this is to probably make one main
package which selects to  "slave" packages that have no function other
than to fetch and make available the other sources.

Questions:
1. Does that sound like the correct way to attack this problem?
2. Are there any existing packages that might do something like this
already and I could use as "inspiration"?

Thanks

Charles
