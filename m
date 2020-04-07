From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:37:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libical: fix CVE-2016-9584
In-Reply-To: <20200328093647.959215-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Mar 2020 10:36:47 +0100")
References: <20200328093647.959215-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1wznnvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libical allows remote attackers to cause a denial of service
 > (use-after-free) and possibly read heap memory via a crafted ics file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
