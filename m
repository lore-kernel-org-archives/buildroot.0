From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 18:54:29 +0100
Subject: [Buildroot] [PATCH 1/1] prosody: security bump to version 0.10.2
In-Reply-To: <20181118121403.25528-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 13:14:03 +0100")
References: <20181118121403.25528-1-fontaine.fabrice@gmail.com>
Message-ID: <87va4unuei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This fixes a cross-host authentication vulnerability, CVE-2018-10847.
 > The issue affects Prosody instances that have multiple virtual hosts
 > (including anonymous authenticated hosts):
 > https://blog.prosody.im/prosody-0-10-2-security-release

 > A full security advisory is available at
 > https://prosody.im/security/advisory_20180531

 > Compute hashes locally as they are no more available on
 > https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
