From: Michael Rommel <rommel@layer-7.net>
Date: Tue, 24 Sep 2013 15:06:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-23
In-Reply-To: <20130924063011.38C4F52C1A0@lolut.humanoidz.org>
References: <20130924063011.38C4F52C1A0@lolut.humanoidz.org>
Message-ID: <7baa74c2417bed2bb6d1b1ba265016e9@imap.tschaeche.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

On Tue, 24 Sep 2013 08:30:11 +0200 (CEST), Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-09-23
>       i686 |            python-pyzmq-13.1.0 | NOK |
> http://autobuild.buildroot.net/results/e8702e999bf77d2fa391dd23f74dbb17e103fe9e/
>       i686 |            python-pyzmq-13.1.0 | NOK |
> http://autobuild.buildroot.net/results/a70e476a7d618eb8b8fa50b059add6bde58d3afa/
>        arm |            python-pyzmq-13.1.0 | NOK |
> http://autobuild.buildroot.net/results/a23e1a50846ba800bb3f89fa2bae0257b9da4a2c/

this is still due to the parsing of the https certificate. Although
Peter changed the URL to an http instead of https URL, it still doesn't
work, since the website redirects again to the https version.
Maybe a newer version of wget or curl may get around this issue, at
least on Ubuntu 12.04LTS I did not experience the problem.

Best wishes,

  Michael.

-- 
Michael Rommel, Erlangen, Germany
