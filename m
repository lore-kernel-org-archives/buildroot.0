From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Sep 2013 16:57:42 +0200
Subject: [Buildroot] [PATCH 1/3] gettext: fixup library permissions
In-Reply-To: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 18 Sep 2013 10:38:01 -0300")
References: <1379511483-30618-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uyub2jd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> libintl.so* is installed without +x permissions thus preventing
 Gustavo> stripping. Fix it up in the post install target hooks.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
