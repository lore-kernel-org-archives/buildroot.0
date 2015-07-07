From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2015 07:52:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/bind: Enable filter-aaaa-on-v4
	option
In-Reply-To: <1436201745-26872-1-git-send-email-nroach44@gmail.com> (Nathaniel
 Roach's message of "Tue, 7 Jul 2015 00:55:45 +0800")
References: <1436201745-26872-1-git-send-email-nroach44@gmail.com>
Message-ID: <87615wpl99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:

 > This allows usage of the filter-aaaa-on-v4 configuration option.
 > This option disables responding with AAAA records when the request
 > 	is made over ipv4. This may be useful on networks with
 > 	ipv6 inside, but no ISP ipv6 (when combined with only
 > 	listening on ipv4).

 > See https://kb.isc.org/article/AA-00576/
 > 	Filter-AAAA-option-in-BIND-9-.html
 > 	for more information.

 > Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
