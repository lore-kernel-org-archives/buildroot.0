From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 00:32:38 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180205214157.GC2806@scaer> (Yann E. MORIN's message of "Mon, 5
 Feb 2018 22:41:57 +0100")
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
 <20180205214157.GC2806@scaer>
Message-ID: <87607bui5l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Baruch, All,
 > On 2018-02-05 23:01 +0200, Baruch Siach spake thusly:
 >> On Mon, Feb 05, 2018 at 09:57:16PM +0100, Romain Naour wrote:
 >> > See: https://sourceware.org/ml/libc-announce/2018/msg00000.html
 >> > https://sourceware.org/glibc/wiki/Release/2.27
 >> Note that this is a security bump fixing CVE-2017-1000408, CVE-2017-1000409, 
 >> CVE-2017-16997, CVE-2018-1000001, and CVE-2018-6485.

 > There are 10 CVE listed in the release annoucement mail, but you list
 > only five here. Why only those?

 > Do we want to list all the CVEs fixed in a release? And if we don't list
 > all, why do we even list only a subset?

 > I don't think we should, especially since the release mail is linked to
 > the commit log and has all the details.

For security bumps we normally DO list the CVEs for ease of use, E.G.:

commit d52cd750c762c78ebcf8623fab8a9c43c9419625
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Sun Jan 28 20:23:02 2018 +0100

    wireshark: security bump to version 2.2.12

    Fixes the following security issues:

    CVE-2017-17997: MRDISC dissector crash
    https://www.wireshark.org/security/wnpa-sec-2018-02.html

    CVE-2018-5334: IxVeriWave file parser crash
    https://www.wireshark.org/security/wnpa-sec-2018-03.html

    CVE-2018-5335: WCP dissector crash
    https://www.wireshark.org/security/wnpa-sec-2018-04.html

    CVE-2018-5336: Multiple dissectors could crash
    https://www.wireshark.org/security/wnpa-sec-2018-01.html

    For more information, see the release notes:
    https://www.wireshark.org/docs/relnotes/wireshark-2.2.12.html

    While we are at it, also add as hash for license file.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


So I prefer to do that as well here.

-- 
Bye, Peter Korsgaard
