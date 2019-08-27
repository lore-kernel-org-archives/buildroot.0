From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Aug 2019 22:14:37 +0200
Subject: [Buildroot] [PATCH buildroot-test] web/search.{js,
 php}: pass the event to the submit handler
In-Reply-To: <20190826121405.23134-1-victor.huesca@bootlin.com> (Victor
 Huesca's message of "Mon, 26 Aug 2019 14:14:05 +0200")
References: <20190826121405.23134-1-victor.huesca@bootlin.com>
Message-ID: <87o90ajrgy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Victor" == Victor Huesca <victor.huesca@bootlin.com> writes:

 > Some web-browsers do not define the global event object on functions
 > callback (see [1]). This cause an 'undefined event' error on the search
 > page. Passing the event argument from the function caller fix this (at
 > least it does on Firefox ESR 60.0.8).

 > [1] http://buildroot-busybox.2317881.n4.nabble.com/New-search-features-on-autobuild-buildroot-org-tt230624.html

 > Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

Thanks!

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
