From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Sep 2016 08:40:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-02
In-Reply-To: <1496256.AqCB2eOqyL@sagittea> (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Sat, 03 Sep 2016 20:59:08 +0200")
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
 <20160903203613.2a7f0a32@free-electrons.com>
 <1496256.AqCB2eOqyL@sagittea>
Message-ID: <87zinmu9vz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 >> However, we could discuss whether it really makes sense to use
 >> https:// as the main download location when all downloads anyway fall
 >> back to downloading from sources.buildroot.net over http://.

 > sources.buildroot.net should provide an https access?

How would that fix issues with older wget versions having problems with
TLS/SNI?

-- 
Bye, Peter Korsgaard
