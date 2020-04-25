From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:06:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/boinc: set curl-config
In-Reply-To: <20200410210025.738362-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 10 Apr 2020 23:00:25 +0200")
References: <20200410210025.738362-1-fontaine.fabrice@gmail.com>
Message-ID: <87d07wujr4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build can fail because boinc uses curl-config that it founds on host:
 > checking for curl-config... /usr/bin/curl-config
 > checking for the version of libcurl... 7.47.0
 > checking for libcurl >= version 7.17.1... yes
 > checking whether libcurl is usable... no

 > Fixes:
 >  - http://autobuild.buildroot.org/results/26ab8024e3ef70b898981763f4ea89b647cc9f4b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
