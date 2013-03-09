From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 21:18:36 +0100
Subject: [Buildroot] [PATCH 5/5] libglib2: use system pcre when available
In-Reply-To: <1362853290-15592-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 9 Mar 2013 19:21:30 +0100")
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362853290-15592-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871ubo2uoz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> By default, glib builds its own internal copy of the pcre library, but
 Thomas> it also allows to use the one available from the system. Use this
 Thomas> possibility when pcre is already selected in the Buildroot
 Thomas> configuration.

Committed, thanks.

-- 
Bye, Peter Korsgaard
