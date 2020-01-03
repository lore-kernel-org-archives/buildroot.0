From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 11:48:53 +0100
Subject: [Buildroot] [POC] buildroot packages site
Message-ID: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I invested some spare time to create a buildroot packages/stats site.
I used python-flask for processing the json output of the pkg-stats
script. To have more information in the output file I did some
modifications on the pkg-stats script as well.

A running installation as fcgi is available here:
http://packages.buildroot.thiery.it

The current sources of the implementation is available under:
https://github.com/hthiery/buildroot-stats
https://github.com/hthiery/buildroot/tree/feature-pkg-stats

Note that this is just a proof of concept with a lot of flaws ... ;-)
Maybe it is possible for you to take a look on it and you can give me
some feedback.

BR
--
Heiko
