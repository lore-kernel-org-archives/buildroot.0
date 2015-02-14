From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 14 Feb 2015 10:53:23 +0100
Subject: [Buildroot] autobuild: wget getid error using br-reproduce-build
Message-ID: <CAHkwnC9YcaDKO75wM__BgeG34Pdnj_oWEGD3n1BTge90tB2v2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm tying to use the br-reproduce-build script to reproduce autobuild
errors, but the script fail when it download the getid file, eg:
wget http://autobuild.buildroot.org/results/d0d4618937af10ee675e84c86b13b0d48050fe47/gitid

The problem is that the url
http://autobuild.buildroot.org/results/d0d4618937af10ee675e84c86b13b0d48050fe47/gitid
does not show the "gitid" file but it redirect to:
 http://autobuild.buildroot.net/results/d0d/d0d4618937af10ee675e84c86b13b0d48050fe47//

To be able to download the getid file i must use:
wget http://autobuild.buildroot.net/results/d0d/d0d4618937af10ee675e84c86b13b0d48050fe47//gitid

Is this behavior expected, so the script must be changed? Or it is a
web site related problem?

Best regards
-- 
Fabio Porcedda
