From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Oct 2014 09:36:58 +0200
Subject: [Buildroot] [PATCH] openssh: place configuration files in
	/etc/ssh
In-Reply-To: <1413186347-8484-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Mon, 13 Oct 2014 09:45:47 +0200")
References: <1413186347-8484-1-git-send-email-jezz@sysmic.org>
Message-ID: <871tqbrtk5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > pkg-autotools.mk fix --sysconfdir to "/etc". This patch restore
 > --sysconfdir to its default value (/etc/ssh)

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
