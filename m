From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2020 22:52:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: also set
 HAVE_LIBCURL
In-Reply-To: <20201128100403.1123560-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Nov 2020 11:04:03 +0100")
References: <20201128100403.1123560-1-fontaine.fabrice@gmail.com>
Message-ID: <87czztyz14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set HAVE_LIBCURL when libcurl is available to enable genprotimg and
 > libekmfweb:
 > https://github.com/ibm-s390-tools/s390-tools/blob/master/README.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
