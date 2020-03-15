From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:15:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/zziplib: fix CVE-2018-16548
In-Reply-To: <20200303201622.283957-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Mar 2020 21:16:21 +0100")
References: <20200303201622.283957-1-fontaine.fabrice@gmail.com>
Message-ID: <87a74hored.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > An issue was discovered in ZZIPlib through 0.13.69. There is a memory
 > leak triggered in the function __zzip_parse_root_directory in zip.c,
 > which will lead to a denial of service attack.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x (not in 2019.02.x), thanks.

-- 
Bye, Peter Korsgaard
