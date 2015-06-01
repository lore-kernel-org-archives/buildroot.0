From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2015 00:02:06 +0200
Subject: [Buildroot] [PATCH] strongswan: security bump to version 5.3.1
In-Reply-To: <1433195001-4823-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 1 Jun 2015 18:43:21 -0300")
References: <1433195001-4823-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bngzt7dt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-3991 - denial-of-service and potential remote code execution
 > vulnerability triggered by IKEv1/IKEv2 messages that contain payloads
 > for the respective other IKE version.
 > other IKE version

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
