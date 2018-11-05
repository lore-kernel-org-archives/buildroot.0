From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Nov 2018 23:18:33 +0100
Subject: [Buildroot] [PATCH 1/1] ngrep: fix static build
In-Reply-To: <20181105182457.22098-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 5 Nov 2018 19:24:57 +0100")
References: <20181105182457.22098-1-fontaine.fabrice@gmail.com>
Message-ID: <877ehrcgna.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 54eeb08d6498e54cc77e212e4f9873b579f76638 wrongly replaced
 > `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs` by
 > "$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3dd8c768beef075494d6be7eff4cbb57b5ec8a41

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
