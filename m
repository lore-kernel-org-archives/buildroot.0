From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 12:11:49 +0100
Subject: [Buildroot] [PATCH 01/32] xcb-util: add dependency on libxcb
In-Reply-To: <1362687540-19440-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:18:29 +0100")
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362687540-19440-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8762104ykq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The xcb-util lacks a dependency on libxcb. Without this dependency, it
 Thomas> fails to build with:

 Thomas> checking for XCB... no

 Thomas> configure: error: in
 Thomas> `/home/thomas/projets/buildroot/output/build/xcb-util-0.3.9':
 Thomas> configure: error: The pkg-config script could not be found or
 Thomas> is too old.  Make sure it is in your PATH or set the PKG_CONFIG
 Thomas> environment variable to the full path to pkg-config.

Committed, thanks.

-- 
Bye, Peter Korsgaard
