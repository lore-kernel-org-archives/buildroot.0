From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 May 2012 00:28:13 +0200
Subject: [Buildroot] [PATCH 1/4] blackfin: adjust available ABIs
In-Reply-To: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 May 2012 11:27:19 +0200")
References: <1336469242-1099-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fwbaxq82.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The FLAT (Separate Data) and FLAT Shared ABIs are rarely used, and the
 Thomas> FLAT Shared ABI requires the user to manually assign an unique ID to
 Thomas> each shared library, which we will never support in
 Thomas> Buildroot. Therefore, restrict ourselves to FLAT and FDPIC.

Committed, thanks.

-- 
Bye, Peter Korsgaard
