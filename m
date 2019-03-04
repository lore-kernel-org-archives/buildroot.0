From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 14:05:46 +0100
Subject: [Buildroot] Python 2.7 end of life on January 1, 2020
In-Reply-To: <506b3ab3-1450-d7c6-56aa-a5bea1a88353@mind.be> (Arnout
 Vandecappelle's message of "Mon, 4 Mar 2019 08:20:11 +0100")
References: <20190301195404.1c00356b@windsurf>
 <506b3ab3-1450-d7c6-56aa-a5bea1a88353@mind.be>
Message-ID: <87zhqaiyc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> This means that our 2020.02 LTS release probably should not have Python
 >> 2.x anymore ?

 >  I don't know. We don't usually terminate a package just because it's EOL.
 > Remember, we have plenty of packages with dead upstreams. Or take Qt 5.6 for
 > example: it's been EOL for how long now?

Qt 5.6 _IS_ still supported, but will go EOL this month:

https://blog.qt.io/blog/2018/11/29/support-qt-5-6-lts-ends-march-2019/

Regarding Python 2.x longer term, I guess it depends on if the python
module authors will continue to support it.

 >  In addition, as opposed to Qt5.6 for example, distros (Debian and Redhat) will
 > keep on maintaining it for a few years still.

 >  So I'd say: as long as it doesn't cause breakage, keep it. Definitely as long
 > as there are other packages depending on it (Kodi...).

Agreed.

-- 
Bye, Peter Korsgaard
