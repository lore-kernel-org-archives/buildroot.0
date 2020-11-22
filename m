From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:31:42 +0100
Subject: [Buildroot] [PATCH] package/xen: add XSA-333..344 security fixes
In-Reply-To: <20201121124206.24581-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 21 Nov 2020 13:42:06 +0100")
References: <20201121124206.24581-1-peter@korsgaard.com>
Message-ID: <87wnydv4xd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - XSA-333: x86 pv: Crash when handling guest access to MSR_MISC_ENABLE
 >   (CVE-2020-25602)
 >   https://xenbits.xenproject.org/xsa/advisory-333.html

 > - XSA-334: Missing unlock in XENMEM_acquire_resource error path
 >   (CVE-2020-25598)
 >   https://xenbits.xenproject.org/xsa/advisory-334.html

 > - XSA-336: race when migrating timers between x86 HVM vCPU-s
 >   (CVE-2020-25604)
 >   https://xenbits.xenproject.org/xsa/advisory-336.html

 > - XSA-337: PCI passthrough code reading back hardware registers
 >   (CVE-2020-25595)
 >   https://xenbits.xenproject.org/xsa/advisory-337.html

 > - XSA-338: once valid event channels may not turn invalid (CVE-2020-25597)
 >   https://xenbits.xenproject.org/xsa/advisory-338.html

 > - XSA-339: x86 pv guest kernel DoS via SYSENTER (CVE-2020-25596)
 >   https://xenbits.xenproject.org/xsa/advisory-339.html

 > - XSA-340: Missing memory barriers when accessing/allocating an event
 >   channel (CVE-2020-25603)
 >   https://xenbits.xenproject.org/xsa/advisory-340.html

 > - XSA-342: out of bounds event channels available to 32-bit x86 domains
 >   (CVE-2020-25600)
 >   https://xenbits.xenproject.org/xsa/advisory-342.html

 > - XSA-343: races with evtchn_reset() (CVE-2020-25599)
 >   https://xenbits.xenproject.org/xsa/advisory-343.html

 > - XSA-344: lack of preemption in evtchn_reset() / evtchn_destroy()
 >   (CVE-2020-25601)
 >   https://xenbits.xenproject.org/xsa/advisory-344.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
