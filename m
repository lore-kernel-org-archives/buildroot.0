From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 16:40:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: security bump to 2.83
In-Reply-To: <20210119180908.18903-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Tue, 19 Jan 2021 19:09:08 +0100")
References: <20210119180908.18903-1-nicolas.cavallari@green-communications.fr>
Message-ID: <87r1lvet8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > From the annoucement:
 > http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q1/014599.html

 > "There are broadly two sets of problems. The first is subtle errors in
 > dnsmasq's protections against the chronic weakness of the DNS protocol
 > to cache-poisoning attacks; the Birthday attack, Kaminsky, etc. [...]

 > [...] the second set of errors is a good old fashioned buffer overflow
 > in dnsmasq's DNSSEC code."

 > Fixes CVE-2020-25681, CVE-2020-25682, CVE-2020-25683, CVE-2020-25684,
 >       CVE-2020-25685, CVE-2020-25686 and CVE-2020-25687

 > Details: https://www.jsof-tech.com/disclosures/dnspooq

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
