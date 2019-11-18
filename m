From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:01:08 +0100
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20191112
In-Reply-To: <20191113161849.23872-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 17:18:49 +0100")
References: <20191113161849.23872-1-peter@korsgaard.com>
Message-ID: <87wobxqqy3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Contains mitigations for the following security vulnerabilities:
 > - CVE-2019-11135: Intel TSX Asynchronous Abort vulnerability:
 >   https://software.intel.com/security-software-guidance/insights/deep-dive-intel-transactional-synchronization-extensions-intel-tsx-asynchronous-abort

 > - CVE-2019-11139: Intel Xeon Scalable Processors Voltage Setting Modulation
 >   vulnerability:
 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00271.html

 > Release notes:
 > https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20191112

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
