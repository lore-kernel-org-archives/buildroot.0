From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:53:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/suricata: bump to version 6.0.1
In-Reply-To: <20201213170420.992917-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 13 Dec 2020 18:04:20 +0100")
References: <20201213170420.992917-1-fontaine.fabrice@gmail.com>
 <20201213170420.992917-2-fontaine.fabrice@gmail.com>
Message-ID: <87czzcwi9w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > These releases are bug fix releases, fixing numerous important issues.
 > The 6.0.1 release also improves the experimental HTTP/2 support.

 > https://suricata-ids.org/2020/12/04/suricata-6-0-1-5-0-5-and-4-1-10-released

Is the libhtp bump a dependency for this when backporting?

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
