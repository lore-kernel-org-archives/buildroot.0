From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Feb 2013 22:13:05 +0100
Subject: [Buildroot] [PATCH v6] wireshark: new package
In-Reply-To: <e64c965f3221d977b9bd2edf99405efd7405f848.1361167992.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 18 Feb 2013 08:18:11 +0200")
References: <e64c965f3221d977b9bd2edf99405efd7405f848.1361167992.git.baruch@tkos.co.il>
Message-ID: <87sj4i7p9a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> This is only the bare minimum needed to build the textual
 Baruch> tshark utility.  Support for more options, including the
 Baruch> wireshark GUI, can be added later.

Committed to next with the --includedir workaround.

-- 
Bye, Peter Korsgaard
