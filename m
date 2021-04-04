From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 11:40:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/lldpd: security bump to version
 1.0.9
In-Reply-To: <20210402195252.2036931-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Apr 2021 21:52:52 +0200")
References: <20210402195252.2036931-1-fontaine.fabrice@gmail.com>
Message-ID: <87wnti1j7y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Out-of-bound read access when parsing LLDP-MED civic address in
 >   liblldpctl for malformed fields.
 > - Fix memory leak when receiving LLDPU with duplicate fields.
 >   CVE-2020-27827.
 > - More memory leak fixes on duplicate TLVs in LLDP, CDP and EDP
 >   (related to CVE-2020-27827).

 > https://github.com/lldpd/lldpd/blob/1.0.9/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
