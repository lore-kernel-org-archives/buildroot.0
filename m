From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 19:02:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/openvmtools: non-executable
 udev rules
In-Reply-To: <20191129142248.6053-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Fri, 29 Nov 2019 15:22:48 +0100")
References: <20191129142248.6053-1-p.debruijn@unilogic.nl>
Message-ID: <87tv6jrkkh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Fixes: /usr/lib/udev/rules.d/99-vmware-scsi-udev.rules is marked executable.
 > Source: https://github.com/vmware/open-vm-tools/pull/376

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed after extending the commit message, thanks.

-- 
Bye, Peter Korsgaard
