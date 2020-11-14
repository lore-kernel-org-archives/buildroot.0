From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:18:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcpdump: fix CVE-2020-8037
In-Reply-To: <20201113202115.538340-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 Nov 2020 21:21:15 +0100")
References: <20201113202115.538340-1-fontaine.fabrice@gmail.com>
Message-ID: <87d00g9ivd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The ppp decapsulator in tcpdump 4.9.3 can be convinced to allocate a
 > large amount of memory.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
