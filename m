From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 21:52:30 +0200
Subject: [Buildroot] [PATCH 06/10] package/hostapd: ignore
 CVE-2021-30004 when using openssl
In-Reply-To: <20210421204235.5956-7-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 21 Apr 2021 15:42:31 -0500")
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
 <20210421204235.5956-7-matthew.weber@rockwellcollins.com>
Message-ID: <87im48hlhd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The CVE can be ignored when the internal TLS impl isn't used.
 > https://security-tracker.debian.org/tracker/CVE-2021-30004
 >  "Issue only affects the "internal" TLS implementation
 >  (CONFIG_TLS=internal)"

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

A conditionally ignored CVE isn't great. Why not just add the fix?

I just gave it a try and it applies cleanly to 2.9.

-- 
Bye, Peter Korsgaard
