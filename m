From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Oct 2014 16:20:01 +0100
Subject: [Buildroot] [PATCH] libpcap: omit -rpath from pcap-config
In-Reply-To: <c33c2710ceee7a99051fe39f96e8480b6440fa79.1414738768.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 31 Oct 2014 08:59:28 +0200")
References: <c33c2710ceee7a99051fe39f96e8480b6440fa79.1414738768.git.baruch@tkos.co.il>
Message-ID: <87fve46zby.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > For target processes the libraries are always in their usual location under
 > /lib and /usr/lib. It doesn't make sense to add RPATH tag pointing to host
 > build directory to programs using libpcap. This commit changes V_RPATH_OPT in
 > pcap-config to remove -rpath from its output.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
