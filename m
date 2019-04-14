From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 17:20:38 +0200
Subject: [Buildroot] [PATCH] package/dacapo: fix indentation
In-Reply-To: <20190414145227.17968-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 14 Apr 2019 16:52:27 +0200")
References: <20190414145227.17968-1-yann.morin.1998@free.fr>
Message-ID: <87o958pq9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes errors reported by running 'make check-package':
 >     package/dacapo/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 >     package/dacapo/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 >     package/dacapo/Config.in:4: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
 >     package/dacapo/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
 >     package/dacapo/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
 >     package/dacapo/Config.in:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
 >     package/dacapo/Config.in:12: should be indented with one tab (http://nightly.buildroot.org/#_config_files)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Daniel J. Leach <dleach@belcan.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
