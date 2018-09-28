From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 15:09:44 +0200
Subject: [Buildroot] [PATCH 1/1] haproxy: security bump to 1.8.14
In-Reply-To: <20180927202156.10941-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 Sep 2018 22:21:56 +0200")
References: <20180927202156.10941-1-fontaine.fabrice@gmail.com>
Message-ID: <87sh1t6a5j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2018-14645 (see
 > https://www.mail-archive.com/haproxy at formilux.org/msg31253.html)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

Notice that haproxy 1.8.3 triggers a number of autobuilder failures
related to pcre2.

-- 
Bye, Peter Korsgaard
