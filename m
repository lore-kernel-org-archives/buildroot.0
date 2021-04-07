From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 09:23:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp: security bump to
 version 1.14.5
In-Reply-To: <20210406183927.1268381-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 6 Apr 2021 20:39:27 +0200")
References: <20210406183927.1268381-1-fontaine.fabrice@gmail.com>
Message-ID: <87blaqeewp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Non-recursive version of ixmlNode_free() avoids stack overflow
 > attack. Fixes CVE-2021-28302.

 > https://github.com/pupnp/pupnp/blob/release-1.14.5/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
