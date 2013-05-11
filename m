From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 22:30:26 +0200
Subject: [Buildroot] [PATCH 1/2] ptpd: new package
In-Reply-To: <1367944785-27159-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 May 2013 13:39:44 -0300")
References: <1367944785-27159-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hai91cpp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add the new ptpd package, loosely based on the one from bug #2305.
 Gustavo> This one handles the IEEE 1588-2002 spec.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in      |  1 +
 Gustavo>  package/ptpd/Config.in |  7 +++++++
 Gustavo>  package/ptpd/S65ptpd   | 29 +++++++++++++++++++++++++++++
 Gustavo>  package/ptpd/ptpd.mk   | 25 +++++++++++++++++++++++++
 Gustavo>  4 files changed, 62 insertions(+)
 Gustavo>  create mode 100644 package/ptpd/Config.in
 Gustavo>  create mode 100644 package/ptpd/S65ptpd

We normally (but not always it seems) mark the init scripts executable
under package/ as well, so I've fixed that and committed both to next,
thanks.

-- 
Bye, Peter Korsgaard
