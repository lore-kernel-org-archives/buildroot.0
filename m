From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 23:23:25 +0100
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
In-Reply-To: <54F8D470.9060308@mind.be>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <54F8D05F.4050300@mind.be>
 <20150305230631.4e19032b@free-electrons.com>
 <54F8D470.9060308@mind.be>
Message-ID: <20150305232325.3e137c1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 05 Mar 2015 23:10:56 +0100, Arnout Vandecappelle wrote:

>  But that's just a condition on the .mk file so it has no implications for the
> missing reverse dependencies.

Absolutely. But it means that the gvfs Samba support becomes unusable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
