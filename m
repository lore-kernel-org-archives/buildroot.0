From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 21:59:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/matio: add upstream security
 fixes
In-Reply-To: <20200502195438.3358786-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 May 2020 21:54:38 +0200")
References: <20200502195438.3358786-1-fontaine.fabrice@gmail.com>
Message-ID: <875zceo6kt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following CVEs:
 >  - CVE-2019-17533: Mat_VarReadNextInfo4 in mat4.c in MATIO 1.5.17 omits
 >    a certain '\0' character, leading to a heap-based buffer over-read in
 >    strdup_vprintf when uninitialized memory is accessed.
 >  - CVE-2019-20017: A stack-based buffer over-read was discovered in
 >    Mat_VarReadNextInfo5 in mat5.c in matio 1.5.17.
 >  - CVE-2019-20018: A stack-based buffer over-read was discovered in
 >    ReadNextCell in mat5.c in matio 1.5.17.
 >  - CVE-2019-20020: A stack-based buffer over-read was discovered in
 >    ReadNextStructField in mat5.c in matio 1.5.17.
 >  - CVE-2019-20052: A memory leak was discovered in Mat_VarCalloc in
 >    mat.c in matio 1.5.17 because SafeMulDims does not consider the
 >    rank==0 case.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
