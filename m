From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Sep 2014 23:11:19 +0200
Subject: [Buildroot] [PATCH v2] whois: Fix unmet dependencies
In-Reply-To: <1411138378-32002-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 19 Sep 2014 16:52:58 +0200")
References: <1411138378-32002-1-git-send-email-jezz@sysmic.org>
Message-ID: <87oaub48p4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Fix :
 >    BR2_PACKAGE_WHOIS selects BR2_PACKAGE_GETTEXT which has unmet direct dependencies (BR2_USE_WCHAR)

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
