From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 16:58:47 +0200
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20200616
In-Reply-To: <20200621201849.30819-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 21 Jun 2020 22:18:48 +0200")
References: <20200621201849.30819-1-peter@korsgaard.com>
Message-ID: <877dv3wlp4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Contains mitigations for the Special Register Buffer Data Sampling
 > (CVE-2020-0543), Vector Register Sampling (CVE-2020-0548) and L1D
 > Eviction Sampling (CVE-2020-0549) hardware vulnerabilities.

 > For more details, see the advisories:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00320.html
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00329.html

 > Adjust the license hash for a change of copyright year:
 > -Copyright (c) 2018-2019 Intel Corporation.
 > +Copyright (c) 2018-2020 Intel Corporation.

 > And adjust the .hash file to use two spaces.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
